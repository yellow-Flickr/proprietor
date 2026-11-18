/// Payment state of an obligation. Normally derived (see [ObligationBalance]),
/// never stored as the source of truth.
enum ObligationPaymentStatus { unpaid, partiallyPaid, paid, overdue }

/// Rent expected for one rental period of a tenancy. Separate from money
/// actually received ([Payment]).
class RentObligation {
  const RentObligation({
    required this.id,
    required this.tenancyId,
    required this.periodStart,
    required this.periodEnd,
    required this.dueDate,
    required this.amountDueMinor,
    required this.currency,
    this.description,
    this.statusOverride,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String tenancyId;

  /// Business dates (UTC midnight).
  final DateTime periodStart;
  final DateTime periodEnd;
  final DateTime dueDate;

  /// Expected amount in minor units (pesewas for GHS).
  final int amountDueMinor;
  final String currency;
  final String? description;

  /// Only for explicit exceptional handling; normally `null` and derived.
  final ObligationPaymentStatus? statusOverride;
  final DateTime createdAt;
  final DateTime updatedAt;
}

/// An obligation together with what has been validly paid against it.
///
/// `amountPaidMinor` must come from allocations of *valid* (non-reversed)
/// payments only.
class ObligationBalance {
  const ObligationBalance({
    required this.obligation,
    required this.amountPaidMinor,
  });

  final RentObligation obligation;
  final int amountPaidMinor;

  int get outstandingMinor => obligation.amountDueMinor - amountPaidMinor;

  /// Derived status on [today] (a business date). An explicit
  /// `statusOverride` wins.
  ObligationPaymentStatus statusOn(DateTime today) {
    final override = obligation.statusOverride;
    if (override != null) return override;
    if (outstandingMinor <= 0) return ObligationPaymentStatus.paid;
    if (today.isAfter(obligation.dueDate)) {
      return ObligationPaymentStatus.overdue;
    }
    return amountPaidMinor > 0
        ? ObligationPaymentStatus.partiallyPaid
        : ObligationPaymentStatus.unpaid;
  }
}
