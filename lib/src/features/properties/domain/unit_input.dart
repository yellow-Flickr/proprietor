import 'package:proprietor/src/core/domain/defaults.dart';
import 'package:proprietor/src/features/properties/domain/unit.dart';

/// Input for creating a unit, either with a new property or added later.
class UnitInput {
  const UnitInput({
    required this.name,
    required this.unitType,
    this.description,
    this.floorOrLevel,
    this.sizeValue,
    this.sizeUnit,
    this.defaultRentMinor,
    this.defaultCurrency = defaultCurrencyCode,
    this.availabilityOverride = AvailabilityRestriction.none,
    this.privateNotes,
  });

  final String name;
  final UnitType unitType;
  final String? description;
  final String? floorOrLevel;
  final double? sizeValue;
  final String? sizeUnit;
  final int? defaultRentMinor;
  final String defaultCurrency;
  final AvailabilityRestriction availabilityOverride;
  final String? privateNotes;
}
