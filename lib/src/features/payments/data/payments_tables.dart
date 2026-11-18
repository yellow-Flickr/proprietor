import 'package:drift/drift.dart';

import '../../../core/domain/defaults.dart';
import '../../tenants/data/tenants_tables.dart';
import '../domain/payment.dart';
import '../domain/payment_allocation.dart';
import '../domain/rent_obligation.dart';

@UseRowClass(RentObligation, generateInsertable: true)
@TableIndex(name: 'rent_obligations_due_date', columns: {#dueDate})
class RentObligations extends Table {
  TextColumn get id => text()();
  TextColumn get tenancyId => text().references(Tenancies, #id)();
  DateTimeColumn get periodStart => dateTime()();
  DateTimeColumn get periodEnd => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  IntColumn get amountDueMinor => integer()();
  TextColumn get currency =>
      text().withDefault(const Constant(defaultCurrencyCode))();
  TextColumn get description => text().nullable()();
  TextColumn get statusOverride => textEnum<ObligationPaymentStatus>()
      .nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  /// No duplicate obligations for the same tenancy and period. The unique
  /// index also serves lookups by tenancy.
  @override
  List<Set<Column>> get uniqueKeys => [
    {tenancyId, periodStart, periodEnd},
  ];

  @override
  List<String> get customConstraints => [
    "CHECK (period_end >= period_start)",
    "CHECK (amount_due_minor > 0)",
    "CHECK (length(currency) = 3)",
  ];
}

@UseRowClass(Payment, generateInsertable: true)
@TableIndex(name: 'payments_tenancy_id', columns: {#tenancyId})
class Payments extends Table {
  TextColumn get id => text()();
  TextColumn get tenancyId => text().references(Tenancies, #id)();
  IntColumn get amountReceivedMinor => integer()();
  TextColumn get currency =>
      text().withDefault(const Constant(defaultCurrencyCode))();
  DateTimeColumn get receivedDate => dateTime()();
  TextColumn get paymentMethod =>
      textEnum<PaymentMethod>()();
  TextColumn get reference => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get recordStatus =>
      textEnum<PaymentRecordStatus>()();
  TextColumn get reversalReason => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (amount_received_minor > 0)",
    "CHECK (length(currency) = 3)",
    "CHECK (record_status <> 'reversed' OR reversal_reason IS NOT NULL)",
  ];
}

@UseRowClass(PaymentAllocation, generateInsertable: true)
@TableIndex(name: 'payment_allocations_payment_id', columns: {#paymentId})
@TableIndex(
  name: 'payment_allocations_rent_obligation_id',
  columns: {#rentObligationId},
)
class PaymentAllocations extends Table {
  TextColumn get id => text()();
  TextColumn get paymentId => text().references(Payments, #id)();
  TextColumn get rentObligationId => text().references(RentObligations, #id)();
  IntColumn get amountAllocatedMinor => integer()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => ["CHECK (amount_allocated_minor > 0)"];
}
