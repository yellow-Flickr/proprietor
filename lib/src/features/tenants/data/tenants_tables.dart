import 'package:drift/drift.dart';

import '../../../core/domain/defaults.dart';
import '../../../core/domain/record_status.dart';
import '../../profile/data/landlord_profiles_table.dart';
import '../../properties/data/properties_tables.dart';
import '../domain/tenancy.dart';
import '../domain/tenant.dart';

@UseRowClass(Tenant, generateInsertable: true)
@TableIndex(name: 'tenants_landlord_id', columns: {#landlordId})
class Tenants extends Table {
  TextColumn get id => text()();
  TextColumn get landlordId => text().references(LandlordProfiles, #id)();
  TextColumn get tenantType => textEnum<TenantType>()();
  TextColumn get fullName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get alternativePhone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get privateNotes => text().nullable()();
  TextColumn get recordStatus => textEnum<RecordStatus>()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get archivedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (length(trim(full_name)) > 0)",
    "CHECK (length(trim(phone_number)) > 0)",
  ];
}

@UseRowClass(Tenancy, generateInsertable: true)
@TableIndex(name: 'tenancies_tenant_id', columns: {#tenantId})
@TableIndex(name: 'tenancies_unit_id', columns: {#unitId})
class Tenancies extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text().references(Tenants, #id)();
  TextColumn get unitId => text().references(Units, #id)();
  TextColumn get previousTenancyId =>
      text().nullable().references(Tenancies, #id)();
  TextColumn get agreementType => textEnum<AgreementType>()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get agreedRentMinor => integer()();
  TextColumn get currency =>
      text().withDefault(const Constant(defaultCurrencyCode))();
  TextColumn get paymentFrequency => textEnum<PaymentFrequency>()();
  IntColumn get customFrequencyMonths => integer().nullable()();
  DateTimeColumn get firstDueDate => dateTime()();
  IntColumn get dueDay => integer().nullable()();
  IntColumn get securityDepositMinor => integer().nullable()();
  IntColumn get advanceAmountMinor => integer().nullable()();
  TextColumn get termsNotes => text().nullable()();
  TextColumn get status => textEnum<TenancyStatus>()();
  DateTimeColumn get effectiveTerminationDate => dateTime().nullable()();
  TextColumn get terminationReason => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  // Dates are stored as ISO-8601 UTC text (see build.yaml), so text
  // comparison is chronological.
  @override
  List<String> get customConstraints => [
    "CHECK (end_date IS NULL OR end_date >= start_date)",
    "CHECK (agreed_rent_minor >= 0)",
    "CHECK (security_deposit_minor IS NULL OR security_deposit_minor >= 0)",
    "CHECK (advance_amount_minor IS NULL OR advance_amount_minor >= 0)",
    "CHECK (due_day IS NULL OR due_day BETWEEN 1 AND 31)",
    "CHECK (custom_frequency_months IS NULL OR custom_frequency_months > 0)",
    "CHECK (payment_frequency <> 'custom' OR custom_frequency_months IS NOT NULL)",
    "CHECK (effective_termination_date IS NULL "
        "OR effective_termination_date >= start_date)",
    "CHECK (length(currency) = 3)",
  ];
}
