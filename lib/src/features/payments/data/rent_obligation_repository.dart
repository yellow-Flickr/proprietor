import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/converters.dart';
import '../../../core/database/database_provider.dart';
import '../domain/rent_obligation.dart';

class RentObligationRepository {
  const RentObligationRepository(this._db);

  final AppDatabase _db;

  Future<RentObligation?> getById(String id) => (_db.select(
    _db.rentObligations,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<RentObligation>> watchForTenancy(String tenancyId) =>
      _forTenancy(tenancyId).watch();

  Future<List<RentObligation>> getForTenancy(String tenancyId) =>
      _forTenancy(tenancyId).get();

  Future<bool> existsForPeriod({
    required String tenancyId,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) async {
    final match =
        await (_db.select(_db.rentObligations)
              ..where(
                (t) =>
                    t.tenancyId.equals(tenancyId) &
                    t.periodStart.equals(
                      DateOnlyConverter.format(periodStart),
                    ) &
                    t.periodEnd.equals(DateOnlyConverter.format(periodEnd)),
              )
              ..limit(1))
            .getSingleOrNull();
    return match != null;
  }

  Future<void> insert(RentObligation obligation) =>
      _db.into(_db.rentObligations).insert(obligation.toInsertable());

  SimpleSelectStatement<$RentObligationsTable, RentObligation> _forTenancy(
    String tenancyId,
  ) => _db.select(_db.rentObligations)
    ..where((t) => t.tenancyId.equals(tenancyId))
    ..orderBy([(t) => OrderingTerm.asc(t.dueDate)]);
}

final rentObligationRepositoryProvider = Provider<RentObligationRepository>(
  (ref) => RentObligationRepository(ref.watch(appDatabaseProvider)),
);
