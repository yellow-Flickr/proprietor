import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../domain/landlord_profile.dart';

class LandlordProfileRepository {
  const LandlordProfileRepository(this._db);

  final AppDatabase _db;

  $LandlordProfilesTable get _table => _db.landlordProfiles;

  /// The single local profile, or `null` before onboarding.
  Future<LandlordProfile?> getProfile() =>
      (_db.select(_table)
            ..orderBy([(t) => OrderingTerm.asc(t.createdAt)])
            ..limit(1))
          .getSingleOrNull();

  Stream<LandlordProfile?> watchProfile() =>
      (_db.select(_table)
            ..orderBy([(t) => OrderingTerm.asc(t.createdAt)])
            ..limit(1))
          .watchSingleOrNull();

  Future<LandlordProfile?> getById(String id) =>
      (_db.select(_table)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> insert(LandlordProfile profile) =>
      _db.into(_table).insert(profile.toInsertable());

  Future<void> update(LandlordProfile profile) =>
      _db.update(_table).replace(profile.toInsertable());
}

final landlordProfileRepositoryProvider = Provider<LandlordProfileRepository>(
  (ref) => LandlordProfileRepository(ref.watch(appDatabaseProvider)),
);
