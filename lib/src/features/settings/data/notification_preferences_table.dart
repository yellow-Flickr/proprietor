import 'package:drift/drift.dart';

import '../../profile/data/landlord_profiles_table.dart';
import '../domain/notification_preference.dart';

@UseRowClass(NotificationPreference, generateInsertable: true)
class NotificationPreferences extends Table {
  TextColumn get id => text()();
  TextColumn get landlordId => text().references(LandlordProfiles, #id)();
  TextColumn get eventType =>
      textEnum<NotificationEventType>()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  IntColumn get daysBefore => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  /// One preference per landlord and event type.
  @override
  List<Set<Column>> get uniqueKeys => [
    {landlordId, eventType},
  ];

  @override
  List<String> get customConstraints => [
    "CHECK (days_before IS NULL OR days_before >= 0)",
  ];
}
