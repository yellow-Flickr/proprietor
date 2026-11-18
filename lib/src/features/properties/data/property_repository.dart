import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/domain/record_status.dart';
import '../domain/property.dart';
import '../domain/unit.dart';

/// Persistence for properties and their units (one aggregate).
class PropertyRepository {
  const PropertyRepository(this._db);

  final AppDatabase _db;

  // ── Properties ────────────────────────────────────────────────────────────

  Stream<List<Property>> watchProperties({
    required String landlordId,
    bool includeArchived = false,
  }) {
    final query = _db.select(_db.properties)
      ..where((t) => t.landlordId.equals(landlordId))
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);
    if (!includeArchived) {
      query.where((t) => t.recordStatus.equalsValue(RecordStatus.active));
    }
    return query.watch();
  }

  Future<Property?> getProperty(String id) => (_db.select(
    _db.properties,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> insertProperty(Property property) =>
      _db.into(_db.properties).insert(property.toInsertable());

  Future<void> updateProperty(Property property) =>
      _db.update(_db.properties).replace(property.toInsertable());

  Future<void> archiveProperty(String id, DateTime at) =>
      (_db.update(_db.properties)..where((t) => t.id.equals(id))).write(
        PropertiesCompanion(
          recordStatus: const Value(RecordStatus.archived),
          archivedAt: Value(at),
          updatedAt: Value(at),
        ),
      );

  // ── Units ─────────────────────────────────────────────────────────────────

  Stream<List<Unit>> watchUnits(
    String propertyId, {
    bool includeArchived = false,
  }) {
    final query = _db.select(_db.units)
      ..where((t) => t.propertyId.equals(propertyId))
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);
    if (!includeArchived) {
      query.where((t) => t.recordStatus.equalsValue(RecordStatus.active));
    }
    return query.watch();
  }

  Future<List<Unit>> getUnits(String propertyId) =>
      (_db.select(_db.units)
            ..where((t) => t.propertyId.equals(propertyId))
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .get();

  Future<Unit?> getUnit(String id) =>
      (_db.select(_db.units)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> insertUnit(Unit unit) =>
      _db.into(_db.units).insert(unit.toInsertable());

  Future<void> updateUnit(Unit unit) =>
      _db.update(_db.units).replace(unit.toInsertable());

  Future<void> archiveUnit(String id, DateTime at) =>
      (_db.update(_db.units)..where((t) => t.id.equals(id))).write(
        UnitsCompanion(
          recordStatus: const Value(RecordStatus.archived),
          archivedAt: Value(at),
          updatedAt: Value(at),
        ),
      );

  Future<void> archiveUnitsOfProperty(String propertyId, DateTime at) =>
      (_db.update(_db.units)..where(
            (t) =>
                t.propertyId.equals(propertyId) &
                t.recordStatus.equalsValue(RecordStatus.active),
          ))
          .write(
            UnitsCompanion(
              recordStatus: const Value(RecordStatus.archived),
              archivedAt: Value(at),
              updatedAt: Value(at),
            ),
          );
}

final propertyRepositoryProvider = Provider<PropertyRepository>(
  (ref) => PropertyRepository(ref.watch(appDatabaseProvider)),
);
