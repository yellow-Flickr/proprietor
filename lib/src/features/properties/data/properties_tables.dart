import 'package:drift/drift.dart';

import '../../../core/domain/defaults.dart';
import '../../../core/domain/record_status.dart';
import '../../profile/data/landlord_profiles_table.dart';
import '../domain/property.dart';
import '../domain/unit.dart';

@UseRowClass(Property, generateInsertable: true)
@TableIndex(name: 'properties_landlord_id', columns: {#landlordId})
class Properties extends Table {
  TextColumn get id => text()();
  TextColumn get landlordId => text().references(LandlordProfiles, #id)();
  TextColumn get name => text()();
  TextColumn get propertyType => textEnum<PropertyType>()();
  TextColumn get description => text().nullable()();
  TextColumn get addressLine => text().nullable()();
  TextColumn get areaOrTown => text().nullable()();
  TextColumn get district => text().nullable()();
  TextColumn get region => text().nullable()();
  TextColumn get countryCode =>
      text().withDefault(const Constant(defaultCountryCode))();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get privateNotes => text().nullable()();
  TextColumn get recordStatus => textEnum<RecordStatus>()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get archivedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (length(trim(name)) > 0)",
    "CHECK (latitude IS NULL OR latitude BETWEEN -90 AND 90)",
    "CHECK (longitude IS NULL OR longitude BETWEEN -180 AND 180)",
  ];
}

@UseRowClass(Unit, generateInsertable: true)
@TableIndex(name: 'units_property_id', columns: {#propertyId})
class Units extends Table {
  TextColumn get id => text()();
  TextColumn get propertyId => text().references(Properties, #id)();
  TextColumn get name => text()();
  TextColumn get unitType => textEnum<UnitType>()();
  TextColumn get description => text().nullable()();
  TextColumn get floorOrLevel => text().nullable()();
  RealColumn get sizeValue => real().nullable()();
  TextColumn get sizeUnit => text().nullable()();
  IntColumn get defaultRentMinor => integer().nullable()();
  TextColumn get defaultCurrency =>
      text().withDefault(const Constant(defaultCurrencyCode))();
  TextColumn get availabilityOverride => textEnum<AvailabilityRestriction>()();
  TextColumn get privateNotes => text().nullable()();
  TextColumn get recordStatus => textEnum<RecordStatus>()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get archivedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (length(trim(name)) > 0)",
    "CHECK (size_value IS NULL OR size_value >= 0)",
    "CHECK (default_rent_minor IS NULL OR default_rent_minor >= 0)",
    "CHECK (length(default_currency) = 3)",
  ];
}
