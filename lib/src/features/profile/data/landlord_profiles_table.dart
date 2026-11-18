import 'package:drift/drift.dart';

import '../../../core/domain/defaults.dart';
import '../domain/landlord_profile.dart';

@UseRowClass(LandlordProfile, generateInsertable: true)
class LandlordProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get defaultCurrency =>
      text().withDefault(const Constant(defaultCurrencyCode))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (length(trim(display_name)) > 0)",
    "CHECK (length(default_currency) = 3)",
  ];
}
