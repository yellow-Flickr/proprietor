import '../../../core/domain/record_status.dart';

/// Describes the overall asset; it does not dictate the type of each unit.
enum PropertyType { residential, commercial, land, mixedUse, other }

/// A physical asset, site or property container.
///
/// Every property has at least one [Unit]; a standalone asset gets a single
/// `entireProperty` unit. Properties with history are archived, never deleted.
class Property {
  const Property({
    required this.id,
    required this.landlordId,
    required this.name,
    required this.propertyType,
    this.description,
    this.addressLine,
    this.areaOrTown,
    this.district,
    this.region,
    required this.countryCode,
    this.latitude,
    this.longitude,
    this.privateNotes,
    required this.recordStatus,
    required this.createdAt,
    required this.updatedAt,
    this.archivedAt,
  });

  final String id;
  final String landlordId;
  final String name;
  final PropertyType propertyType;
  final String? description;
  final String? addressLine;
  final String? areaOrTown;
  final String? district;

  /// Ghanaian region.
  final String? region;

  /// ISO 3166-1 alpha-2, default `GH`.
  final String countryCode;
  final double? latitude;
  final double? longitude;

  /// Landlord-only notes.
  final String? privateNotes;
  final RecordStatus recordStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;

  bool get isArchived => recordStatus == RecordStatus.archived;

  /// Copies user-editable fields. Nullable fields take a function so they can
  /// be explicitly cleared: `copyWith(description: () => null)`.
  Property copyWith({
    String? name,
    PropertyType? propertyType,
    String? Function()? description,
    String? Function()? addressLine,
    String? Function()? areaOrTown,
    String? Function()? district,
    String? Function()? region,
    String? countryCode,
    double? Function()? latitude,
    double? Function()? longitude,
    String? Function()? privateNotes,
    DateTime? updatedAt,
  }) {
    return Property(
      id: id,
      landlordId: landlordId,
      name: name ?? this.name,
      propertyType: propertyType ?? this.propertyType,
      description: description == null ? this.description : description(),
      addressLine: addressLine == null ? this.addressLine : addressLine(),
      areaOrTown: areaOrTown == null ? this.areaOrTown : areaOrTown(),
      district: district == null ? this.district : district(),
      region: region == null ? this.region : region(),
      countryCode: countryCode ?? this.countryCode,
      latitude: latitude == null ? this.latitude : latitude(),
      longitude: longitude == null ? this.longitude : longitude(),
      privateNotes: privateNotes == null ? this.privateNotes : privateNotes(),
      recordStatus: recordStatus,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt,
    );
  }
}
