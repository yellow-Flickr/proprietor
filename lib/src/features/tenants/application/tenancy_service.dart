import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/transaction_runner.dart';
import '../../../core/domain/dates.dart';
import '../../../core/domain/defaults.dart';
import '../../../core/domain/domain_exception.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/id_generator.dart';
import '../../properties/data/property_repository.dart';
import '../data/tenancy_repository.dart';
import '../data/tenant_repository.dart';
import '../domain/tenancy.dart';

/// Tenancy lifecycle: draft → confirmed (upcoming/active) → completed or
/// terminated.
///
/// Enforces: one tenant + one unit per tenancy; end date not before start;
/// no overlapping confirmed tenancies on a unit; only drafts are editable
/// (confirmed terms are never rewritten; renew instead).
class TenancyService {
  TenancyService(
    this._tenancies,
    this._tenants,
    this._properties,
    this._transactions, {
    required this._ids,
    required this._clock,
  });

  final TenancyRepository _tenancies;
  final TenantRepository _tenants;
  final PropertyRepository _properties;
  final TransactionRunner _transactions;
  final IdGenerator _ids;
  final Clock _clock;

  /// Today's business date in the device's timezone.
  DateTime get _today => dateOnly(_clock().toLocal());

  Future<Tenancy> getTenancy(String id) async =>
      await _tenancies.getById(id) ?? (throw NotFoundException('Tenancy', id));

  Stream<List<Tenancy>> watchTenancies({
    String? unitId,
    String? tenantId,
    List<TenancyStatus>? statuses,
  }) => _tenancies.watchTenancies(
    unitId: unitId,
    tenantId: tenantId,
    statuses: statuses,
  );

  /// Creates a tenancy as a draft, or confirms it immediately when [confirm]
  /// is true.
  ///
  /// Pass [previousTenancyId] to record a renewal; it must belong to the same
  /// tenant and unit. [currency] defaults to the unit's default currency.
  Future<Tenancy> createTenancy({
    required String tenantId,
    required String unitId,
    required AgreementType agreementType,
    required DateTime startDate,
    DateTime? endDate,
    required int agreedRentMinor,
    String? currency,
    required PaymentFrequency paymentFrequency,
    int? customFrequencyMonths,
    required DateTime firstDueDate,
    int? dueDay,
    int? securityDepositMinor,
    int? advanceAmountMinor,
    String? termsNotes,
    String? previousTenancyId,
    bool confirm = false,
  }) async {
    final tenant = await _tenants.getById(tenantId);
    if (tenant == null) throw NotFoundException('Tenant', tenantId);
    if (tenant.isArchived) {
      throw const ConflictException('Tenant is archived');
    }
    final unit = await _properties.getUnit(unitId);
    if (unit == null) throw NotFoundException('Unit', unitId);
    if (unit.isArchived) throw const ConflictException('Unit is archived');

    if (previousTenancyId != null) {
      final previous = await getTenancy(previousTenancyId);
      if (previous.tenantId != tenantId || previous.unitId != unitId) {
        throw const ValidationException(
          'A renewal must be for the same tenant and unit',
        );
      }
    }

    final now = _clock();
    var tenancy = Tenancy(
      id: _ids(),
      tenantId: tenantId,
      unitId: unitId,
      previousTenancyId: previousTenancyId,
      agreementType: agreementType,
      startDate: dateOnly(startDate),
      endDate: endDate == null ? null : dateOnly(endDate),
      agreedRentMinor: agreedRentMinor,
      currency: currency ?? unit.defaultCurrency,
      paymentFrequency: paymentFrequency,
      customFrequencyMonths: paymentFrequency == PaymentFrequency.custom
          ? customFrequencyMonths
          : null,
      firstDueDate: dateOnly(firstDueDate),
      dueDay: dueDay,
      securityDepositMinor: securityDepositMinor,
      advanceAmountMinor: advanceAmountMinor,
      termsNotes: termsNotes,
      status: TenancyStatus.draft,
      createdAt: now,
      updatedAt: now,
    );
    _validateTerms(tenancy);

    if (!confirm) {
      await _tenancies.insert(tenancy);
      return tenancy;
    }
    if (!unit.isOfferable) {
      throw const ConflictException('Unit is not available for a new tenancy');
    }
    tenancy = tenancy.copyWith(status: _confirmedStatusFor(tenancy));
    return _transactions.run(() async {
      await _ensureNoOverlap(tenancy);
      await _tenancies.insert(tenancy);
      return tenancy;
    });
  }

  /// Edits a draft. Confirmed tenancies cannot be edited; renew instead.
  Future<Tenancy> updateDraft(Tenancy edited) async {
    final existing = await getTenancy(edited.id);
    if (existing.status != TenancyStatus.draft) {
      throw const ConflictException('Only draft tenancies can be edited');
    }
    final tenancy = edited.copyWith(
      startDate: dateOnly(edited.startDate),
      endDate: () => edited.endDate == null ? null : dateOnly(edited.endDate!),
      firstDueDate: dateOnly(edited.firstDueDate),
      customFrequencyMonths: () =>
          edited.paymentFrequency == PaymentFrequency.custom
          ? edited.customFrequencyMonths
          : null,
      status: TenancyStatus.draft,
      updatedAt: _clock(),
    );
    _validateTerms(tenancy);
    await _tenancies.update(tenancy);
    return tenancy;
  }

  /// Confirms a draft, reserving the unit for its date range.
  Future<Tenancy> confirmTenancy(String id) async {
    final draft = await getTenancy(id);
    if (draft.status != TenancyStatus.draft) {
      throw const ConflictException('Only draft tenancies can be confirmed');
    }
    final unit = await _properties.getUnit(draft.unitId);
    if (unit == null || !unit.isOfferable) {
      throw const ConflictException('Unit is not available for a new tenancy');
    }
    final tenancy = draft.copyWith(
      status: _confirmedStatusFor(draft),
      updatedAt: _clock(),
    );
    return _transactions.run(() async {
      await _ensureNoOverlap(tenancy);
      await _tenancies.update(tenancy);
      return tenancy;
    });
  }

  /// Ends a confirmed tenancy early. Obligations and payments are kept.
  Future<Tenancy> terminateTenancy(
    String id, {
    required DateTime effectiveDate,
    String? reason,
  }) async {
    final existing = await getTenancy(id);
    if (!existing.status.isConfirmed) {
      throw const ConflictException(
        'Only upcoming or active tenancies can be terminated',
      );
    }
    final date = dateOnly(effectiveDate);
    if (date.isBefore(existing.startDate)) {
      throw const ValidationException(
        'Termination date cannot be before the start date',
      );
    }
    final end = existing.endDate;
    if (end != null && date.isAfter(end)) {
      throw const ValidationException(
        'Termination date cannot be after the end date',
      );
    }
    final tenancy = existing.copyWith(
      status: TenancyStatus.terminated,
      effectiveTerminationDate: () => date,
      terminationReason: () => reason,
      updatedAt: _clock(),
    );
    await _tenancies.update(tenancy);
    return tenancy;
  }

  /// Deletes a draft. Drafts carry no history, so removal is safe.
  Future<void> discardDraft(String id) async {
    final existing = await getTenancy(id);
    if (existing.status != TenancyStatus.draft) {
      throw const ConflictException('Only draft tenancies can be discarded');
    }
    await _tenancies.delete(id);
  }

  /// Moves confirmed tenancies along by date: upcoming → active once started,
  /// active → completed once past the end date. Returns the changed records.
  ///
  /// Call on app start (and e.g. daily) so stored statuses track the calendar.
  Future<List<Tenancy>> refreshStatuses() async {
    final today = _today;
    final now = _clock();
    final confirmed = await _tenancies.getTenancies(
      statuses: TenancyStatus.confirmed,
    );
    final changed = <Tenancy>[];
    for (final tenancy in confirmed) {
      final next = _statusOn(tenancy, today);
      if (next != tenancy.status) {
        changed.add(tenancy.copyWith(status: next, updatedAt: now));
      }
    }
    if (changed.isNotEmpty) {
      await _transactions.run(() async {
        for (final tenancy in changed) {
          await _tenancies.update(tenancy);
        }
      });
    }
    return changed;
  }

  TenancyStatus _confirmedStatusFor(Tenancy tenancy) =>
      tenancy.startDate.isAfter(_today)
      ? TenancyStatus.upcoming
      : TenancyStatus.active;

  TenancyStatus _statusOn(Tenancy tenancy, DateTime today) {
    final end = tenancy.endDate;
    if (end != null && today.isAfter(end)) return TenancyStatus.completed;
    if (tenancy.startDate.isAfter(today)) return TenancyStatus.upcoming;
    return TenancyStatus.active;
  }

  Future<void> _ensureNoOverlap(Tenancy tenancy) async {
    final overlapping = await _tenancies.findConfirmedOverlapping(
      unitId: tenancy.unitId,
      start: tenancy.startDate,
      end: tenancy.endDate,
      excludeId: tenancy.id,
    );
    if (overlapping.isNotEmpty) {
      throw const ConflictException(
        'The unit already has a confirmed tenancy for these dates',
      );
    }
  }

  void _validateTerms(Tenancy tenancy) {
    final end = tenancy.endDate;
    if (end != null && end.isBefore(tenancy.startDate)) {
      throw const ValidationException(
        'End date cannot be before the start date',
      );
    }
    if (tenancy.agreedRentMinor <= 0) {
      throw const ValidationException('Agreed rent must be greater than zero');
    }
    if (!isValidCurrencyCode(tenancy.currency)) {
      throw ValidationException('Invalid currency code "${tenancy.currency}"');
    }
    if (tenancy.paymentFrequency == PaymentFrequency.custom &&
        (tenancy.customFrequencyMonths ?? 0) <= 0) {
      throw const ValidationException(
        'Custom frequency requires a number of months greater than zero',
      );
    }
    final dueDay = tenancy.dueDay;
    if (dueDay != null && (dueDay < 1 || dueDay > 31)) {
      throw const ValidationException('Due day must be between 1 and 31');
    }
    if ((tenancy.securityDepositMinor ?? 0) < 0 ||
        (tenancy.advanceAmountMinor ?? 0) < 0) {
      throw const ValidationException(
        'Deposit and advance amounts cannot be negative',
      );
    }
  }
}

final tenancyServiceProvider = Provider<TenancyService>(
  (ref) => TenancyService(
    ref.watch(tenancyRepositoryProvider),
    ref.watch(tenantRepositoryProvider),
    ref.watch(propertyRepositoryProvider),
    ref.watch(transactionRunnerProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);
