import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/database/app_database.dart';
import 'package:proprietor/src/core/database/database_provider.dart';
import 'package:proprietor/src/core/utils/clock.dart';
import 'package:proprietor/src/features/payments/application/payment_service.dart';
import 'package:proprietor/src/features/payments/application/rent_obligation_service.dart';
import 'package:proprietor/src/features/profile/application/landlord_profile_service.dart';
import 'package:proprietor/src/features/profile/domain/landlord_profile.dart';
import 'package:proprietor/src/features/properties/application/property_service.dart';
import 'package:proprietor/src/features/properties/domain/property.dart';
import 'package:proprietor/src/features/properties/domain/unit.dart';
import 'package:proprietor/src/features/settings/application/notification_preference_service.dart';
import 'package:proprietor/src/features/tenants/application/tenancy_service.dart';
import 'package:proprietor/src/features/tenants/application/tenant_service.dart';
import 'package:proprietor/src/features/tenants/domain/tenancy.dart';
import 'package:proprietor/src/features/tenants/domain/tenant.dart';

/// The app's real provider graph over an in-memory database and a fixed
/// clock. Disposed automatically at the end of the test.
class TestApp {
  TestApp() {
    container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWith((ref) {
          final db = AppDatabase(NativeDatabase.memory());
          ref.onDispose(db.close);
          return db;
        }),
        clockProvider.overrideWithValue(() => now),
      ],
    );
    addTearDown(container.dispose);
  }

  late final ProviderContainer container;

  /// Current instant seen by services. 11:00 UTC keeps "today" on the same
  /// calendar date in almost every local timezone.
  DateTime now = DateTime.utc(2026, 11, 16, 11);

  AppDatabase get db => container.read(appDatabaseProvider);
  LandlordProfileService get profiles =>
      container.read(landlordProfileServiceProvider);
  PropertyService get properties => container.read(propertyServiceProvider);
  TenantService get tenants => container.read(tenantServiceProvider);
  TenancyService get tenancies => container.read(tenancyServiceProvider);
  RentObligationService get obligations =>
      container.read(rentObligationServiceProvider);
  PaymentService get payments => container.read(paymentServiceProvider);
  NotificationPreferenceService get notifications =>
      container.read(notificationPreferenceServiceProvider);

  /// Landlord with one single-unit property and one tenant.
  Future<Portfolio> seedPortfolio() async {
    final landlord = await profiles.createProfile(displayName: 'Ama Owusu');
    final property = await properties.createProperty(
      landlordId: landlord.id,
      name: 'East Legon House',
      propertyType: PropertyType.residential,
    );
    final unit = (await properties.watchUnits(property.id).first).single;
    final tenant = await tenants.createTenant(
      landlordId: landlord.id,
      fullName: 'Kofi Mensah',
      phoneNumber: '+233 20 000 0000',
    );
    return Portfolio(landlord, property, unit, tenant);
  }

  /// Monthly tenancy at GHS 1,500.00, confirmed unless [confirm] is false.
  Future<Tenancy> createTenancy(
    Portfolio p, {
    DateTime? start,
    DateTime? end,
    bool confirm = true,
    String? unitId,
  }) {
    final startDate = start ?? DateTime.utc(2026, 1, 1);
    return tenancies.createTenancy(
      tenantId: p.tenant.id,
      unitId: unitId ?? p.unit.id,
      agreementType: AgreementType.rental,
      startDate: startDate,
      endDate: end ?? DateTime.utc(2026, 12, 31),
      agreedRentMinor: 150000,
      paymentFrequency: PaymentFrequency.monthly,
      firstDueDate: startDate,
      confirm: confirm,
    );
  }
}

class Portfolio {
  Portfolio(this.landlord, this.property, this.unit, this.tenant);

  final LandlordProfile landlord;
  final Property property;
  final Unit unit;
  final Tenant tenant;
}
