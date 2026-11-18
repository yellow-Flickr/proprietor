import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/database/app_database.dart';
import 'package:proprietor/src/core/domain/record_status.dart';
import 'package:proprietor/src/features/properties/domain/property.dart';
import 'package:proprietor/src/features/properties/domain/unit.dart';
import 'package:proprietor/src/features/tenants/domain/tenancy.dart';

import '../../helpers/test_app.dart';

/// Database-level guarantees that back up the service rules.
void main() {
  late TestApp app;

  setUp(() => app = TestApp());

  test('stores enums as snake_case and business dates as YYYY-MM-DD', () async {
    final p = await app.seedPortfolio();
    await app.properties.updateProperty(
      p.property.copyWith(propertyType: PropertyType.mixedUse),
    );
    await app.createTenancy(p, start: DateTime.utc(2026, 3, 5));

    final property = await app.db
        .customSelect('SELECT property_type FROM properties')
        .getSingle();
    expect(property.read<String>('property_type'), 'mixed_use');

    final tenancy = await app.db
        .customSelect('SELECT start_date, status FROM tenancies')
        .getSingle();
    expect(tenancy.read<String>('start_date'), '2026-03-05');
    expect(tenancy.read<String>('status'), 'active');
  });

  test('rejects a unit pointing to a missing property (foreign key)', () async {
    final now = DateTime.utc(2026);
    final orphan = Unit(
      id: 'u1',
      propertyId: 'missing',
      name: 'Room 1',
      unitType: UnitType.room,
      defaultCurrency: 'GHS',
      availabilityOverride: AvailabilityRestriction.none,
      recordStatus: RecordStatus.active,
      createdAt: now,
      updatedAt: now,
    );
    await expectLater(
      app.db.into(app.db.units).insert(orphan.toInsertable()),
      throwsA(anything),
    );
  });

  test('rejects a tenancy ending before it starts (CHECK)', () async {
    final p = await app.seedPortfolio();
    final now = DateTime.utc(2026);
    final invalid = Tenancy(
      id: 't1',
      tenantId: p.tenant.id,
      unitId: p.unit.id,
      agreementType: AgreementType.rental,
      startDate: DateTime.utc(2026, 6, 1),
      endDate: DateTime.utc(2026, 5, 1),
      agreedRentMinor: 1000,
      currency: 'GHS',
      paymentFrequency: PaymentFrequency.monthly,
      firstDueDate: DateTime.utc(2026, 6, 1),
      status: TenancyStatus.draft,
      createdAt: now,
      updatedAt: now,
    );
    await expectLater(
      app.db.into(app.db.tenancies).insert(invalid.toInsertable()),
      throwsA(anything),
    );
  });
}
