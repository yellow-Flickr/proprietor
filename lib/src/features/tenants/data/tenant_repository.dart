import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/domain/record_status.dart';
import '../domain/tenant.dart';

class TenantRepository {
  const TenantRepository(this._db);

  final AppDatabase _db;

  Stream<List<Tenant>> watchTenants({
    required String landlordId,
    bool includeArchived = false,
  }) {
    final query = _db.select(_db.tenants)
      ..where((t) => t.landlordId.equals(landlordId))
      ..orderBy([(t) => OrderingTerm.asc(t.fullName)]);
    if (!includeArchived) {
      query.where((t) => t.recordStatus.equalsValue(RecordStatus.active));
    }
    return query.watch();
  }

  Future<Tenant?> getById(String id) => (_db.select(
    _db.tenants,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> insert(Tenant tenant) =>
      _db.into(_db.tenants).insert(tenant.toInsertable());

  Future<void> update(Tenant tenant) =>
      _db.update(_db.tenants).replace(tenant.toInsertable());

  Future<void> archive(String id, DateTime at) =>
      (_db.update(_db.tenants)..where((t) => t.id.equals(id))).write(
        TenantsCompanion(
          recordStatus: const Value(RecordStatus.archived),
          archivedAt: Value(at),
          updatedAt: Value(at),
        ),
      );
}

final tenantRepositoryProvider = Provider<TenantRepository>(
  (ref) => TenantRepository(ref.watch(appDatabaseProvider)),
);
