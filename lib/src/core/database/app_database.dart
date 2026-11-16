import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

/// The app's single local SQLite database.
///
/// Register new tables in [DriftDatabase.tables] (define them under
/// `core/database/tables/`) and data-access objects in [DriftDatabase.daos].
/// Feature data layers should reach the database through DAOs or
/// repositories, never from widgets.
///
/// Whenever the schema changes: bump [schemaVersion], add a step to
/// [migration], then run `dart run build_runner build`.
@DriftDatabase(tables: [])
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
