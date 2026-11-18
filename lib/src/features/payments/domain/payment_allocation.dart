/// Applies part (or all) of a [Payment] to a [RentObligation].
///
/// Enables partial payments and one payment covering several periods.
class PaymentAllocation {
  const PaymentAllocation({
    required this.id,
    required this.paymentId,
    required this.rentObligationId,
    required this.amountAllocatedMinor,
    required this.createdAt,
  });

  final String id;
  final String paymentId;
  final String rentObligationId;
  final int amountAllocatedMinor;
  final DateTime createdAt;
}
