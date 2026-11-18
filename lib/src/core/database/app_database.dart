import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

// Feature tables, plus the domain types their generated code
// refers to.
import '../../features/payments/data/payments_tables.dart';
import '../../features/payments/domain/payment.dart';
import '../../features/payments/domain/payment_allocation.dart';
import '../../features/payments/domain/rent_obligation.dart';
import '../../features/profile/data/landlord_profiles_table.dart';
import '../../features/profile/domain/landlord_profile.dart';
import '../../features/properties/data/properties_tables.dart';
import '../../features/properties/domain/property.dart';
import '../../features/properties/domain/unit.dart';
import '../../features/settings/data/notification_preferences_table.dart';
import '../../features/settings/domain/notification_preference.dart';
import '../../features/tenants/data/tenants_tables.dart';
import '../../features/tenants/domain/tenancy.dart';
import '../../features/tenants/domain/tenant.dart';
import '../domain/defaults.dart';
import '../domain/record_status.dart';

part 'app_database.g.dart';

/// The app's single local SQLite database.
///
/// Tables are defined in each feature's `data/` folder and registered here;
/// this is the composition point for the schema. Generated row classes are the
/// features' domain entities (`@UseRowClass`). Feature repositories wrap all
/// queries; widgets and services never touch the database directly.
///
/// Whenever the schema changes: bump [schemaVersion], add a step to
/// [migration], then run `dart run build_runner build`.
@DriftDatabase(
  tables: [
    LandlordProfiles,
    Properties,
    Units,
    Tenants,
    Tenancies,
    RentObligations,
    Payments,
    PaymentAllocations,
    NotificationPreferences,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Opens the on-device database. Pass [executor] to use a different
  /// connection, e.g. `NativeDatabase.memory()` in tests.
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static const databaseName = 'proprietor';

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      // Add one step per version, e.g.:
      // if (from < 2) await m.addColumn(properties, properties.notes);
    },
    beforeOpen: (details) async {
      // SQLite leaves foreign key constraints off unless enabled per
      // connection.
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  static QueryExecutor _openConnection() {
    // Stores the file in the app's documents directory and runs queries on a
    // background isolate.
    return driftDatabase(name: databaseName);
  }
}
