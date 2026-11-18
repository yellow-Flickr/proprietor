import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../domain/payment.dart';
import '../domain/payment_allocation.dart';

/// Persistence for payments and their allocations.
///
/// All allocation totals count only allocations of **valid** payments, so a
/// reversal is reflected everywhere without touching allocation rows.
class PaymentRepository {
  const PaymentRepository(this._db);

  final AppDatabase _db;

  // ── Payments ──────────────────────────────────────────────────────────────

  Future<Payment?> getPayment(String id) => (_db.select(
    _db.payments,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<Payment>> watchForTenancy(String tenancyId) =>
      (_db.select(_db.payments)
            ..where((t) => t.tenancyId.equals(tenancyId))
            ..orderBy([
              (t) => OrderingTerm.desc(t.receivedDate),
              (t) => OrderingTerm.desc(t.createdAt),
            ]))
          .watch();

  Future<void> insertPayment(Payment payment) =>
      _db.into(_db.payments).insert(payment.toInsertable());

  Future<void> markReversed(String id, String reason, DateTime at) =>
      (_db.update(_db.payments)..where((t) => t.id.equals(id))).write(
        PaymentsCompanion(
          recordStatus: const Value(PaymentRecordStatus.reversed),
          reversalReason: Value(reason),
          updatedAt: Value(at),
        ),
      );

  // ── Allocations ───────────────────────────────────────────────────────────

  Future<void> insertAllocation(PaymentAllocation allocation) =>
      _db.into(_db.paymentAllocations).insert(allocation.toInsertable());

  Future<List<PaymentAllocation>> getAllocationsForPayment(String paymentId) =>
      (_db.select(_db.paymentAllocations)
            ..where((t) => t.paymentId.equals(paymentId))
            ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
          .get();

  /// Sum allocated from [paymentId] (regardless of its status).
  Future<int> totalAllocatedFromPayment(String paymentId) async {
    final total = _db.paymentAllocations.amountAllocatedMinor.sum();
    final query = _db.selectOnly(_db.paymentAllocations)
      ..addColumns([total])
      ..where(_db.paymentAllocations.paymentId.equals(paymentId));
    return (await query.getSingle()).read(total) ?? 0;
  }

  /// Sum validly paid towards [obligationId].
  Future<int> totalPaidTowardsObligation(String obligationId) async {
    final total = _db.paymentAllocations.amountAllocatedMinor.sum();
    final query = _validAllocations()
      ..addColumns([total])
      ..where(_db.paymentAllocations.rentObligationId.equals(obligationId));
    return (await query.getSingle()).read(total) ?? 0;
  }

  /// Amount validly paid per obligation for every obligation of [tenancyId].
  /// Obligations with nothing paid are absent from the map.
  Future<Map<String, int>> paidByObligationForTenancy(String tenancyId) async {
    final obligationId = _db.paymentAllocations.rentObligationId;
    final total = _db.paymentAllocations.amountAllocatedMinor.sum();
    final query = _validAllocations()
      ..addColumns([obligationId, total])
      ..where(_db.payments.tenancyId.equals(tenancyId))
      ..groupBy([obligationId]);
    final rows = await query.get();
    return {
      for (final row in rows) row.read(obligationId)!: row.read(total) ?? 0,
    };
  }

  /// Allocations joined to their payment, restricted to valid payments.
  JoinedSelectStatement<$PaymentAllocationsTable, PaymentAllocation>
  _validAllocations() {
    final query = _db.selectOnly(_db.paymentAllocations);
    query.join([
      innerJoin(
        _db.payments,
        _db.payments.id.equalsExp(_db.paymentAllocations.paymentId),
        useColumns: false,
      ),
    ]);
    query.where(
      _db.payments.recordStatus.equalsValue(PaymentRecordStatus.valid),
    );
    return query;
  }
}

final paymentRepositoryProvider = Provider<PaymentRepository>(
  (ref) => PaymentRepository(ref.watch(appDatabaseProvider)),
);
