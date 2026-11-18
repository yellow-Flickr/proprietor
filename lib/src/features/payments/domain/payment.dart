enum PaymentMethod { cash, mobileMoney, bankTransfer, other }

/// Confirmed payments are never deleted; mistakes are reversed.
enum PaymentRecordStatus { valid, reversed }

/// Money the landlord actually received for a tenancy.
class Payment {
  const Payment({
    required this.id,
    required this.tenancyId,
    required this.amountReceivedMinor,
    required this.currency,
    required this.receivedDate,
    required this.paymentMethod,
    this.reference,
    this.notes,
    required this.recordStatus,
    this.reversalReason,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String tenancyId;

  /// Total actually received, in minor units.
  final int amountReceivedMinor;
  final String currency;

  /// Business date the money was received (UTC midnight).
  final DateTime receivedDate;
  final PaymentMethod paymentMethod;

  /// Transaction or receipt reference (e.g. Mobile Money transaction ID).
  final String? reference;
  final String? notes;
  final PaymentRecordStatus recordStatus;
  final String? reversalReason;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isValid => recordStatus == PaymentRecordStatus.valid;
}
