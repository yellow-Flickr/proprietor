/// The person using the app and owning the local portfolio.
///
/// The MVP has exactly one local profile; it is also the ownership boundary
/// for properties and tenants so multi-account support can be added later.
class LandlordProfile {
  const LandlordProfile({
    required this.id,
    required this.displayName,
    this.phoneNumber,
    this.email,
    required this.defaultCurrency,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String displayName;
  final String? phoneNumber;
  final String? email;

  /// ISO 4217 code applied to new records, e.g. `GHS`.
  final String defaultCurrency;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Nullable fields take a function so they can be explicitly cleared:
  /// `copyWith(email: () => null)`.
  LandlordProfile copyWith({
    String? displayName,
    String? Function()? phoneNumber,
    String? Function()? email,
    String? defaultCurrency,
    DateTime? updatedAt,
  }) {
    return LandlordProfile(
      id: id,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber == null ? this.phoneNumber : phoneNumber(),
      email: email == null ? this.email : email(),
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
