import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../domain/notification_preference.dart';

class NotificationPreferenceRepository {
  const NotificationPreferenceRepository(this._db);

  final AppDatabase _db;

  Stream<List<NotificationPreference>> watchForLandlord(String landlordId) =>
      (_db.select(
        _db.notificationPreferences,
      )..where((t) => t.landlordId.equals(landlordId))).watch();

  Future<List<NotificationPreference>> getForLandlord(String landlordId) =>
      (_db.select(
        _db.notificationPreferences,
      )..where((t) => t.landlordId.equals(landlordId))).get();

  Future<NotificationPreference?> getById(String id) => (_db.select(
    _db.notificationPreferences,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> insert(NotificationPreference preference) =>
      _db.into(_db.notificationPreferences).insert(preference.toInsertable());

  Future<void> update(NotificationPreference preference) => _db
      .update(_db.notificationPreferences)
      .replace(preference.toInsertable());
}

final notificationPreferenceRepositoryProvider =
    Provider<NotificationPreferenceRepository>(
      (ref) => NotificationPreferenceRepository(ref.watch(appDatabaseProvider)),
    );
