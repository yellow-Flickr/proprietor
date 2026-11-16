import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';

/// App-wide [AppDatabase] instance.
///
/// Created on first use and closed when the root `ProviderScope` is disposed,
/// so it has exactly one owner. Feature data layers depend on this provider
/// (directly, or through their DAO/repository providers); tests override it
/// with an in-memory database:
///
/// ```dart
/// appDatabaseProvider.overrideWith((ref) {
///   final db = AppDatabase(NativeDatabase.memory());
///   ref.onDispose(db.close);
///   return db;
/// })
/// ```
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});
