import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';
import 'database_provider.dart';

/// Lets application services run several repository calls atomically without
/// depending on the database directly.
///
/// Drift transactions are zone-based: every repository call made inside
/// [run] joins the same transaction, and any thrown error rolls it back.
class TransactionRunner {
  const TransactionRunner(this._db);

  final AppDatabase _db;

  Future<T> run<T>(Future<T> Function() action) => _db.transaction(action);
}

final transactionRunnerProvider = Provider<TransactionRunner>(
  (ref) => TransactionRunner(ref.watch(appDatabaseProvider)),
);
