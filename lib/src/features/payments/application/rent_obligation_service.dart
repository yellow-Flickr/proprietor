import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/dates.dart';
import '../../../core/domain/domain_exception.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/id_generator.dart';
import '../../tenants/data/tenancy_repository.dart';
import '../../tenants/domain/tenancy.dart';
import '../data/payment_repository.dart';
import '../data/rent_obligation_repository.dart';
import '../domain/rent_obligation.dart';

/// Rent obligations (what is expected) and their derived balances.
///
/// Automatic schedule generation from tenancy terms is intentionally not
/// implemented yet: it depends on the open decisions about proration and
/// month-end due dates (data-model reference §10, items 2 and 4).
class RentObligationService {
  RentObligationService(
    this._obligations,
    this._payments,
    this._tenancies, {
    required this._ids,
    required this._clock,
  });

  final RentObligationRepository _obligations;
  final PaymentRepository _payments;
  final TenancyRepository _tenancies;
  final IdGenerator _ids;
  final Clock _clock;

  Stream<List<RentObligation>> watchObligations(String tenancyId) =>
      _obligations.watchForTenancy(tenancyId);

  Future<RentObligation> getObligation(String id) async =>
      await _obligations.getById(id) ??
      (throw NotFoundException('RentObligation', id));

  /// Adds an obligation for one rental period. Currency always follows the
  /// tenancy (one currency per tenancy in the MVP).
  Future<RentObligation> addObligation({
    required String tenancyId,
    required DateTime periodStart,
    required DateTime periodEnd,
    required DateTime dueDate,
    required int amountDueMinor,
    String? description,
  }) async {
    final tenancy = await _tenancies.getById(tenancyId);
    if (tenancy == null) throw NotFoundException('Tenancy', tenancyId);
    if (tenancy.status == TenancyStatus.draft) {
      throw const ConflictException(
        'Confirm the tenancy before adding obligations',
      );
    }
    final start = dateOnly(periodStart);
    final end = dateOnly(periodEnd);
    if (end.isBefore(start)) {
      throw const ValidationException(
        'Period end cannot be before period start',
      );
    }
    if (amountDueMinor <= 0) {
      throw const ValidationException('Amount due must be greater than zero');
    }
    if (await _obligations.existsForPeriod(
      tenancyId: tenancyId,
      periodStart: start,
      periodEnd: end,
    )) {
      throw const ConflictException(
        'An obligation already exists for this period',
      );
    }

    final now = _clock();
    final obligation = RentObligation(
      id: _ids(),
      tenancyId: tenancyId,
      periodStart: start,
      periodEnd: end,
      dueDate: dateOnly(dueDate),
      amountDueMinor: amountDueMinor,
      currency: tenancy.currency,
      description: description,
      createdAt: now,
      updatedAt: now,
    );
    await _obligations.insert(obligation);
    return obligation;
  }

  /// Every obligation of [tenancyId] with what has been validly paid against
  /// it, ordered by due date.
  Future<List<ObligationBalance>> getBalances(String tenancyId) async {
    final obligations = await _obligations.getForTenancy(tenancyId);
    final paid = await _payments.paidByObligationForTenancy(tenancyId);
    return [
      for (final obligation in obligations)
        ObligationBalance(
          obligation: obligation,
          amountPaidMinor: paid[obligation.id] ?? 0,
        ),
    ];
  }

  Future<ObligationBalance> getBalance(String obligationId) async {
    final obligation = await getObligation(obligationId);
    return ObligationBalance(
      obligation: obligation,
      amountPaidMinor: await _payments.totalPaidTowardsObligation(obligationId),
    );
  }
}

final rentObligationServiceProvider = Provider<RentObligationService>(
  (ref) => RentObligationService(
    ref.watch(rentObligationRepositoryProvider),
    ref.watch(paymentRepositoryProvider),
    ref.watch(tenancyRepositoryProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);
