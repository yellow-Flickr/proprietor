import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/transaction_runner.dart';
import '../../../core/domain/dates.dart';
import '../../../core/domain/domain_exception.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/id_generator.dart';
import '../../tenants/data/tenancy_repository.dart';
import '../../tenants/domain/tenancy.dart';
import '../data/payment_repository.dart';
import '../data/rent_obligation_repository.dart';
import '../domain/payment.dart';
import '../domain/payment_allocation.dart';

/// Part of a payment to apply to one obligation.
class AllocationInput {
  const AllocationInput({
    required this.rentObligationId,
    required this.amountMinor,
  });

  final String rentObligationId;
  final int amountMinor;
}

/// Recording, allocating and reversing payments.
///
/// Enforces: allocations stay within the payment amount and the obligation's
/// amount due; payment and obligation belong to the same tenancy and
/// currency; reversed payments are excluded from all totals; payments are
/// never deleted.
class PaymentService {
  PaymentService(
    this._payments,
    this._obligations,
    this._tenancies,
    this._transactions, {
    required this._ids,
    required this._clock,
  });

  final PaymentRepository _payments;
  final RentObligationRepository _obligations;
  final TenancyRepository _tenancies;
  final TransactionRunner _transactions;
  final IdGenerator _ids;
  final Clock _clock;

  Stream<List<Payment>> watchPayments(String tenancyId) =>
      _payments.watchForTenancy(tenancyId);

  Future<Payment> getPayment(String id) async =>
      await _payments.getPayment(id) ??
      (throw NotFoundException('Payment', id));

  Future<List<PaymentAllocation>> getAllocations(String paymentId) =>
      _payments.getAllocationsForPayment(paymentId);

  /// Records money received and, optionally, allocates it in the same
  /// transaction. Any amount not allocated stays visible as unallocated.
  ///
  /// [currency] defaults to the tenancy's currency and must match it.
  Future<Payment> recordPayment({
    required String tenancyId,
    required int amountReceivedMinor,
    required DateTime receivedDate,
    required PaymentMethod paymentMethod,
    String? currency,
    String? reference,
    String? notes,
    List<AllocationInput> allocations = const [],
  }) async {
    final tenancy = await _tenancies.getById(tenancyId);
    if (tenancy == null) throw NotFoundException('Tenancy', tenancyId);
    if (tenancy.status == TenancyStatus.draft) {
      throw const ConflictException(
        'Confirm the tenancy before recording payments',
      );
    }
    if (amountReceivedMinor <= 0) {
      throw const ValidationException(
        'Amount received must be greater than zero',
      );
    }
    if (currency != null && currency != tenancy.currency) {
      throw ValidationException(
        'Payment currency must match the tenancy currency '
        '(${tenancy.currency})',
      );
    }

    final now = _clock();
    final payment = Payment(
      id: _ids(),
      tenancyId: tenancyId,
      amountReceivedMinor: amountReceivedMinor,
      currency: tenancy.currency,
      receivedDate: dateOnly(receivedDate),
      paymentMethod: paymentMethod,
      reference: reference,
      notes: notes,
      recordStatus: PaymentRecordStatus.valid,
      createdAt: now,
      updatedAt: now,
    );

    return _transactions.run(() async {
      await _payments.insertPayment(payment);
      for (final allocation in allocations) {
        await _allocate(
          payment.id,
          allocation.rentObligationId,
          allocation.amountMinor,
        );
      }
      return payment;
    });
  }

  /// Applies [amountMinor] of a valid payment to an obligation.
  Future<PaymentAllocation> allocate({
    required String paymentId,
    required String rentObligationId,
    required int amountMinor,
  }) => _transactions.run(
    () => _allocate(paymentId, rentObligationId, amountMinor),
  );

  /// Marks a payment reversed. Its allocations stay on record but no longer
  /// count towards any obligation.
  Future<void> reversePayment(
    String paymentId, {
    required String reason,
  }) async {
    final trimmed = reason.trim();
    if (trimmed.isEmpty) {
      throw const ValidationException('A reversal reason is required');
    }
    final payment = await getPayment(paymentId);
    if (!payment.isValid) {
      throw const ConflictException('Payment is already reversed');
    }
    await _payments.markReversed(paymentId, trimmed, _clock());
  }

  /// Amount of a payment not yet allocated to any obligation (0 once
  /// reversed).
  Future<int> unallocatedAmount(String paymentId) async {
    final payment = await getPayment(paymentId);
    if (!payment.isValid) return 0;
    final allocated = await _payments.totalAllocatedFromPayment(paymentId);
    return payment.amountReceivedMinor - allocated;
  }

  /// Must run inside a transaction so the limit checks and the insert are
  /// atomic.
  Future<PaymentAllocation> _allocate(
    String paymentId,
    String obligationId,
    int amountMinor,
  ) async {
    if (amountMinor <= 0) {
      throw const ValidationException(
        'Allocated amount must be greater than zero',
      );
    }
    final payment = await getPayment(paymentId);
    if (!payment.isValid) {
      throw const ConflictException('Cannot allocate a reversed payment');
    }
    final obligation = await _obligations.getById(obligationId);
    if (obligation == null) {
      throw NotFoundException('RentObligation', obligationId);
    }
    if (obligation.tenancyId != payment.tenancyId) {
      throw const ValidationException(
        'Payment and obligation belong to different tenancies',
      );
    }
    if (obligation.currency != payment.currency) {
      throw const ValidationException(
        'Payment and obligation currencies differ',
      );
    }

    final paymentAllocated = await _payments.totalAllocatedFromPayment(
      paymentId,
    );
    if (paymentAllocated + amountMinor > payment.amountReceivedMinor) {
      throw ConflictException(
        'Allocation exceeds the unallocated payment amount '
        '(${payment.amountReceivedMinor - paymentAllocated} remaining)',
      );
    }
    final obligationPaid = await _payments.totalPaidTowardsObligation(
      obligationId,
    );
    if (obligationPaid + amountMinor > obligation.amountDueMinor) {
      throw ConflictException(
        'Allocation exceeds the outstanding obligation amount '
        '(${obligation.amountDueMinor - obligationPaid} outstanding)',
      );
    }

    final allocation = PaymentAllocation(
      id: _ids(),
      paymentId: paymentId,
      rentObligationId: obligationId,
      amountAllocatedMinor: amountMinor,
      createdAt: _clock(),
    );
    await _payments.insertAllocation(allocation);
    return allocation;
  }
}

final paymentServiceProvider = Provider<PaymentService>(
  (ref) => PaymentService(
    ref.watch(paymentRepositoryProvider),
    ref.watch(rentObligationRepositoryProvider),
    ref.watch(tenancyRepositoryProvider),
    ref.watch(transactionRunnerProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);
