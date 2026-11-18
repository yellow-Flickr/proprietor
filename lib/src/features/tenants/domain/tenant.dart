import '../../../core/domain/record_status.dart';

/// Only `individual` is supported in the MVP.
enum TenantType { individual, organisation }

/// A reusable record of a person who rents or leases a unit.
///
/// Not a user account. A phone number does not uniquely identify a tenant.
class Tenant {
  const Tenant({
    required this.id,
    required this.landlordId,
    required this.tenantType,
    required this.fullName,
    required this.phoneNumber,
    this.alternativePhone,
    this.email,
    this.address,
    this.privateNotes,
    required this.recordStatus,
    required this.createdAt,
    required this.updatedAt,
    this.archivedAt,
  });

  final String id;
  final String landlordId;
  final TenantType tenantType;
  final String fullName;
  final String phoneNumber;
  final String? alternativePhone;
  final String? email;
  final String? address;
  final String? privateNotes;
  final RecordStatus recordStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;

  bool get isArchived => recordStatus == RecordStatus.archived;

  /// Copies user-editable fields. Nullable fields take a function so they can
  /// be explicitly cleared: `copyWith(email: () => null)`.
  Tenant copyWith({
    String? fullName,
    String? phoneNumber,
    String? Function()? alternativePhone,
    String? Function()? email,
    String? Function()? address,
    String? Function()? privateNotes,
    DateTime? updatedAt,
  }) {
    return Tenant(
      id: id,
      landlordId: landlordId,
      tenantType: tenantType,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      alternativePhone: alternativePhone == null
          ? this.alternativePhone
          : alternativePhone(),
      email: email == null ? this.email : email(),
      address: address == null ? this.address : address(),
      privateNotes: privateNotes == null ? this.privateNotes : privateNotes(),
      recordStatus: recordStatus,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt,
    );
  }
}
