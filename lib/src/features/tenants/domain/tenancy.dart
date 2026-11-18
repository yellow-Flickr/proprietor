enum AgreementType { rental, lease }

/// Lifecycle of a tenancy.
///
/// - `draft`: terms being prepared; editable; does not reserve the unit.
/// - `upcoming` / `active`: confirmed (start date in the future / reached);
///   reserves the unit and cannot overlap another confirmed tenancy.
/// - `completed`: ran to its end date.
/// - `terminated`: ended early (see `effectiveTerminationDate`).
enum TenancyStatus {
  draft,
  upcoming,
  active,
  completed,
  terminated;

  /// Confirmed tenancies reserve their unit for their date range.
  bool get isConfirmed => this == upcoming || this == active;

  /// Values whose date ranges must not overlap on the same unit.
  static const confirmed = [upcoming, active];
}

enum PaymentFrequency {
  monthly(1),
  quarterly(3),
  semiAnnual(6),
  annual(12),
  custom(null);

  const PaymentFrequency(this.months);

  /// Months per period; `null` for [custom] (see
  /// `Tenancy.customFrequencyMonths`).
  final int? months;
}

/// The contractual relationship between one tenant and one unit for a period.
///
/// Confirmed terms are never rewritten: a renewal creates a new tenancy that
/// points to the old one via [previousTenancyId].
class Tenancy {
  const Tenancy({
    required this.id,
    required this.tenantId,
    required this.unitId,
    this.previousTenancyId,
    required this.agreementType,
    required this.startDate,
    this.endDate,
    required this.agreedRentMinor,
    required this.currency,
    required this.paymentFrequency,
    this.customFrequencyMonths,
    required this.firstDueDate,
    this.dueDay,
    this.securityDepositMinor,
    this.advanceAmountMinor,
    this.termsNotes,
    required this.status,
    this.effectiveTerminationDate,
    this.terminationReason,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String tenantId;
  final String unitId;
  final String? previousTenancyId;
  final AgreementType agreementType;

  /// Business date (UTC midnight).
  final DateTime startDate;

  /// Business date (UTC midnight); `null` for an open-ended agreement.
  final DateTime? endDate;

  /// Agreed recurring rent in minor units (pesewas for GHS).
  final int agreedRentMinor;
  final String currency;
  final PaymentFrequency paymentFrequency;
  final int? customFrequencyMonths;
  final DateTime firstDueDate;

  /// Optional recurring due day of month (1–31).
  final int? dueDay;
  final int? securityDepositMinor;
  final int? advanceAmountMinor;
  final String? termsNotes;
  final TenancyStatus status;
  final DateTime? effectiveTerminationDate;
  final String? terminationReason;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Months per payment period, resolving `custom`.
  int? get periodMonths => paymentFrequency.months ?? customFrequencyMonths;

  /// Whether this tenancy's date range intersects `[start, end]`
  /// (`end == null` means open-ended). Both ranges are inclusive.
  bool overlaps(DateTime start, DateTime? end) {
    final startsBeforeOtherEnds = end == null || !startDate.isAfter(end);
    final endsAfterOtherStarts = endDate == null || !endDate!.isBefore(start);
    return startsBeforeOtherEnds && endsAfterOtherStarts;
  }

  /// Copies draft-editable terms. Nullable fields take a function so they can
  /// be explicitly cleared: `copyWith(endDate: () => null)`.
  Tenancy copyWith({
    AgreementType? agreementType,
    DateTime? startDate,
    DateTime? Function()? endDate,
    int? agreedRentMinor,
    String? currency,
    PaymentFrequency? paymentFrequency,
    int? Function()? customFrequencyMonths,
    DateTime? firstDueDate,
    int? Function()? dueDay,
    int? Function()? securityDepositMinor,
    int? Function()? advanceAmountMinor,
    String? Function()? termsNotes,
    TenancyStatus? status,
    DateTime? Function()? effectiveTerminationDate,
    String? Function()? terminationReason,
    DateTime? updatedAt,
  }) {
    return Tenancy(
      id: id,
      tenantId: tenantId,
      unitId: unitId,
      previousTenancyId: previousTenancyId,
      agreementType: agreementType ?? this.agreementType,
      startDate: startDate ?? this.startDate,
      endDate: endDate == null ? this.endDate : endDate(),
      agreedRentMinor: agreedRentMinor ?? this.agreedRentMinor,
      currency: currency ?? this.currency,
      paymentFrequency: paymentFrequency ?? this.paymentFrequency,
      customFrequencyMonths: customFrequencyMonths == null
          ? this.customFrequencyMonths
          : customFrequencyMonths(),
      firstDueDate: firstDueDate ?? this.firstDueDate,
      dueDay: dueDay == null ? this.dueDay : dueDay(),
      securityDepositMinor: securityDepositMinor == null
          ? this.securityDepositMinor
          : securityDepositMinor(),
      advanceAmountMinor: advanceAmountMinor == null
          ? this.advanceAmountMinor
          : advanceAmountMinor(),
      termsNotes: termsNotes == null ? this.termsNotes : termsNotes(),
      status: status ?? this.status,
      effectiveTerminationDate: effectiveTerminationDate == null
          ? this.effectiveTerminationDate
          : effectiveTerminationDate(),
      terminationReason: terminationReason == null
          ? this.terminationReason
          : terminationReason(),
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
