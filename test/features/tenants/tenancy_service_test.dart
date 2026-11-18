import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/domain/domain_exception.dart';
import 'package:proprietor/src/features/properties/domain/unit.dart';
import 'package:proprietor/src/features/tenants/domain/tenancy.dart';

import '../../helpers/test_app.dart';

void main() {
  late TestApp app;
  late Portfolio p;

  setUp(() async {
    app = TestApp(); // today = 2026-11-16
    p = await app.seedPortfolio();
  });

  group('overlap', () {
    test(
      'rejects a confirmed tenancy overlapping another on the unit',
      () async {
        await app.createTenancy(p); // 2026-01-01 .. 2026-12-31
        expect(
          () => app.createTenancy(
            p,
            start: DateTime.utc(2026, 12, 31),
            end: DateTime.utc(2027, 6, 30),
          ),
          throwsA(isA<ConflictException>()),
        );
      },
    );

    test('allows back-to-back tenancies', () async {
      await app.createTenancy(p);
      final next = await app.createTenancy(
        p,
        start: DateTime.utc(2027, 1, 1),
        end: DateTime.utc(2027, 12, 31),
      );
      expect(next.status, TenancyStatus.upcoming);
    });

    test('drafts do not reserve the unit', () async {
      await app.createTenancy(p, confirm: false);
      final confirmed = await app.createTenancy(p);
      expect(confirmed.status, TenancyStatus.active);
    });

    test('an open-ended tenancy blocks every later start', () async {
      await app.tenancies.createTenancy(
        tenantId: p.tenant.id,
        unitId: p.unit.id,
        agreementType: AgreementType.lease,
        startDate: DateTime.utc(2026, 1, 1),
        agreedRentMinor: 100000,
        paymentFrequency: PaymentFrequency.annual,
        firstDueDate: DateTime.utc(2026, 1, 1),
        confirm: true,
      );
      expect(
        () => app.createTenancy(
          p,
          start: DateTime.utc(2030, 1, 1),
          end: DateTime.utc(2030, 12, 31),
        ),
        throwsA(isA<ConflictException>()),
      );
    });

    test('termination frees the unit after the termination date', () async {
      final first = await app.createTenancy(p);
      await app.tenancies.terminateTenancy(
        first.id,
        effectiveDate: DateTime.utc(2026, 6, 30),
        reason: 'Relocated',
      );
      final replacement = await app.createTenancy(
        p,
        start: DateTime.utc(2026, 7, 1),
        end: DateTime.utc(2027, 6, 30),
      );
      expect(replacement.status, TenancyStatus.active);
    });
  });

  test('rejects an end date before the start date', () {
    expect(
      () => app.createTenancy(
        p,
        start: DateTime.utc(2026, 6, 1),
        end: DateTime.utc(2026, 5, 31),
      ),
      throwsA(isA<ValidationException>()),
    );
  });

  test('custom frequency requires a number of months', () {
    expect(
      () => app.tenancies.createTenancy(
        tenantId: p.tenant.id,
        unitId: p.unit.id,
        agreementType: AgreementType.rental,
        startDate: DateTime.utc(2026, 1, 1),
        agreedRentMinor: 100000,
        paymentFrequency: PaymentFrequency.custom,
        firstDueDate: DateTime.utc(2026, 1, 1),
      ),
      throwsA(isA<ValidationException>()),
    );
  });

  test('only drafts can be edited; confirming locks the terms', () async {
    final draft = await app.createTenancy(p, confirm: false);
    final edited = await app.tenancies.updateDraft(
      draft.copyWith(agreedRentMinor: 175000),
    );
    expect(edited.agreedRentMinor, 175000);

    final confirmed = await app.tenancies.confirmTenancy(draft.id);
    expect(confirmed.status, TenancyStatus.active);
    expect(
      () => app.tenancies.updateDraft(confirmed.copyWith(agreedRentMinor: 1)),
      throwsA(isA<ConflictException>()),
    );
  });

  test('a unit under maintenance cannot take a confirmed tenancy', () async {
    await app.properties.updateUnit(
      p.unit.copyWith(
        availabilityOverride: AvailabilityRestriction.maintenance,
      ),
    );
    expect(() => app.createTenancy(p), throwsA(isA<ConflictException>()));
  });

  test('a renewal must be for the same tenant and unit', () async {
    final original = await app.createTenancy(p);
    final otherTenant = await app.tenants.createTenant(
      landlordId: p.landlord.id,
      fullName: 'Efua Asante',
      phoneNumber: '+233 24 111 1111',
    );
    expect(
      () => app.tenancies.createTenancy(
        tenantId: otherTenant.id,
        unitId: p.unit.id,
        agreementType: AgreementType.rental,
        startDate: DateTime.utc(2027, 1, 1),
        agreedRentMinor: 150000,
        paymentFrequency: PaymentFrequency.monthly,
        firstDueDate: DateTime.utc(2027, 1, 1),
        previousTenancyId: original.id,
      ),
      throwsA(isA<ValidationException>()),
    );
  });

  test('refreshStatuses follows the calendar', () async {
    final current = await app.createTenancy(p); // ends 2026-12-31
    final next = await app.createTenancy(
      p,
      start: DateTime.utc(2027, 1, 1),
      end: DateTime.utc(2027, 12, 31),
    );

    app.now = DateTime.utc(2027, 1, 2, 11);
    final changed = await app.tenancies.refreshStatuses();

    expect(
      {for (final t in changed) t.id: t.status},
      {current.id: TenancyStatus.completed, next.id: TenancyStatus.active},
    );
  });

  test('a tenant with a confirmed tenancy cannot be archived', () async {
    await app.createTenancy(p);
    expect(
      () => app.tenants.archiveTenant(p.tenant.id),
      throwsA(isA<ConflictException>()),
    );
  });
}
