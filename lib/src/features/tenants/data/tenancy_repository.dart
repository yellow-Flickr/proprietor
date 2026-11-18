import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/converters.dart';
import '../../../core/database/database_provider.dart';
import '../domain/tenancy.dart';

const _statusConverter = SnakeCaseEnumConverter(TenancyStatus.values);

class TenancyRepository {
  const TenancyRepository(this._db);

  final AppDatabase _db;

  Future<Tenancy?> getById(String id) => (_db.select(
    _db.tenancies,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Tenancies filtered by any combination of unit, tenant and status,
  /// newest start date first.
  Stream<List<Tenancy>> watchTenancies({
    String? unitId,
    String? tenantId,
    List<TenancyStatus>? statuses,
  }) => _query(unitId: unitId, tenantId: tenantId, statuses: statuses).watch();

  Future<List<Tenancy>> getTenancies({
    String? unitId,
    String? tenantId,
    List<TenancyStatus>? statuses,
  }) => _query(unitId: unitId, tenantId: tenantId, statuses: statuses).get();

  /// Confirmed (upcoming/active) tenancies on [unitId] whose range intersects
  /// `[start, end]` (inclusive; `end == null` means open-ended).
  Future<List<Tenancy>> findConfirmedOverlapping({
    required String unitId,
    required DateTime start,
    DateTime? end,
    String? excludeId,
  }) {
    final query = _query(unitId: unitId, statuses: TenancyStatus.confirmed)
      ..where(
        (t) =>
            t.endDate.isNull() |
            t.endDate.isBiggerOrEqualValue(DateOnlyConverter.format(start)),
      );
    if (end != null) {
      query.where(
        (t) => t.startDate.isSmallerOrEqualValue(DateOnlyConverter.format(end)),
      );
    }
    if (excludeId != null) {
      query.where((t) => t.id.equals(excludeId).not());
    }
    return query.get();
  }

  Future<void> insert(Tenancy tenancy) =>
      _db.into(_db.tenancies).insert(tenancy.toInsertable());

  Future<void> update(Tenancy tenancy) =>
      _db.update(_db.tenancies).replace(tenancy.toInsertable());

  Future<void> delete(String id) =>
      (_db.delete(_db.tenancies)..where((t) => t.id.equals(id))).go();

  SimpleSelectStatement<$TenanciesTable, Tenancy> _query({
    String? unitId,
    String? tenantId,
    List<TenancyStatus>? statuses,
  }) {
    final query = _db.select(_db.tenancies)
      ..orderBy([(t) => OrderingTerm.desc(t.startDate)]);
    if (unitId != null) query.where((t) => t.unitId.equals(unitId));
    if (tenantId != null) query.where((t) => t.tenantId.equals(tenantId));
    if (statuses != null) {
      query.where((t) => t.status.isIn(statuses.map(_statusConverter.toSql)));
    }
    return query;
  }
}

final tenancyRepositoryProvider = Provider<TenancyRepository>(
  (ref) => TenancyRepository(ref.watch(appDatabaseProvider)),
);
