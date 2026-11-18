import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/domain/domain_exception.dart';
import 'package:proprietor/src/features/properties/domain/property.dart';
import 'package:proprietor/src/features/properties/domain/unit.dart';
import 'package:proprietor/src/features/properties/domain/unit_input.dart';

import '../../helpers/test_app.dart';

void main() {
  late TestApp app;
  late String landlordId;

  setUp(() async {
    app = TestApp();
    landlordId = (await app.profiles.createProfile(displayName: 'Ama')).id;
  });

  test('a property without units gets one entire-property unit', () async {
    final property = await app.properties.createProperty(
      landlordId: landlordId,
      name: 'Plot 12',
      propertyType: PropertyType.land,
    );

    final units = await app.properties.watchUnits(property.id).first;
    expect(units, hasLength(1));
    expect(units.single.unitType, UnitType.entireProperty);
    expect(units.single.defaultCurrency, 'GHS');
    expect(property.countryCode, 'GH');
  });

  test('creates the given units instead of a default one', () async {
    final property = await app.properties.createProperty(
      landlordId: landlordId,
      name: 'Osu Flats',
      propertyType: PropertyType.residential,
      units: const [
        UnitInput(name: 'Flat 1', unitType: UnitType.apartment),
        UnitInput(name: 'Flat 2', unitType: UnitType.apartment),
      ],
    );

    final units = await app.properties.watchUnits(property.id).first;
    expect(units.map((u) => u.name), ['Flat 1', 'Flat 2']);
  });

  test('archiving a property archives its units and keeps the rows', () async {
    final property = await app.properties.createProperty(
      landlordId: landlordId,
      name: 'Shop Row',
      propertyType: PropertyType.commercial,
    );
    await app.properties.archiveProperty(property.id);

    expect(
      await app.properties.watchProperties(landlordId: landlordId).first,
      isEmpty,
    );
    final archived = await app.properties.getProperty(property.id);
    expect(archived.isArchived, isTrue);
    expect(archived.archivedAt, app.now);
    final units = await app.properties
        .watchUnits(property.id, includeArchived: true)
        .first;
    expect(units.single.isArchived, isTrue);
  });

  test('rejects invalid input', () async {
    expect(
      () => app.properties.createProperty(
        landlordId: landlordId,
        name: '  ',
        propertyType: PropertyType.other,
      ),
      throwsA(isA<ValidationException>()),
    );
    expect(
      () => app.properties.createProperty(
        landlordId: landlordId,
        name: 'Half GPS',
        propertyType: PropertyType.other,
        latitude: 5.6,
      ),
      throwsA(isA<ValidationException>()),
    );
  });
}
