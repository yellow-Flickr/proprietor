import '../../../core/domain/record_status.dart';

enum UnitType {
  entireProperty,
  house,
  apartment,
  room,
  shop,
  office,
  warehouse,
  landParcel,
  other,
}

/// A restriction on offering a unit that is unrelated to occupancy.
///
/// Occupancy itself is derived from tenancies, never set with this value.
enum AvailabilityRestriction { none, unavailable, maintenance }

/// The independently rentable or leasable portion of a [Property].
class Unit {
  const Unit({
    required this.id,
    required this.propertyId,
    required this.name,
    required this.unitType,
    this.description,
    this.floorOrLevel,
    this.sizeValue,
    this.sizeUnit,
    this.defaultRentMinor,
    required this.defaultCurrency,
    required this.availabilityOverride,
    this.privateNotes,
    required this.recordStatus,
    required this.createdAt,
    required this.updatedAt,
    this.archivedAt,
  });

  final String id;
  final String propertyId;

  /// Unit name, number or reference.
  final String name;
  final UnitType unitType;
  final String? description;
  final String? floorOrLevel;
  final double? sizeValue;

  /// Square metres, acres, plots, ...
  final String? sizeUnit;

  /// Suggested rent in minor currency units (pesewas for GHS).
  final int? defaultRentMinor;
  final String defaultCurrency;
  final AvailabilityRestriction availabilityOverride;
  final String? privateNotes;
  final RecordStatus recordStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;

  bool get isArchived => recordStatus == RecordStatus.archived;

  /// Whether the unit may be offered for a new tenancy, ignoring occupancy.
  bool get isOfferable =>
      !isArchived && availabilityOverride == AvailabilityRestriction.none;

  /// Copies user-editable fields. Nullable fields take a function so they can
  /// be explicitly cleared: `copyWith(sizeValue: () => null)`.
  Unit copyWith({
    String? name,
    UnitType? unitType,
    String? Function()? description,
    String? Function()? floorOrLevel,
    double? Function()? sizeValue,
    String? Function()? sizeUnit,
    int? Function()? defaultRentMinor,
    String? defaultCurrency,
    AvailabilityRestriction? availabilityOverride,
    String? Function()? privateNotes,
    DateTime? updatedAt,
  }) {
    return Unit(
      id: id,
      propertyId: propertyId,
      name: name ?? this.name,
      unitType: unitType ?? this.unitType,
      description: description == null ? this.description : description(),
      floorOrLevel: floorOrLevel == null ? this.floorOrLevel : floorOrLevel(),
      sizeValue: sizeValue == null ? this.sizeValue : sizeValue(),
      sizeUnit: sizeUnit == null ? this.sizeUnit : sizeUnit(),
      defaultRentMinor: defaultRentMinor == null
          ? this.defaultRentMinor
          : defaultRentMinor(),
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      availabilityOverride: availabilityOverride ?? this.availabilityOverride,
      privateNotes: privateNotes == null ? this.privateNotes : privateNotes(),
      recordStatus: recordStatus,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt,
    );
  }
}
