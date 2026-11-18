import 'package:drift/drift.dart';

import '../domain/dates.dart';

/// Stores a business date (rent due date, tenancy start, ...) as `YYYY-MM-DD`
/// text so timezone conversion can never shift it. Values read back are UTC
/// midnight [DateTime]s (see [dateOnly]).
///
/// Because the stored text sorts chronologically, date columns can be
/// compared in SQL against [DateOnlyConverter.format]ted values.
class DateOnlyConverter extends TypeConverter<DateTime, String> {
  const DateOnlyConverter();

  static String format(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-'
      '${value.month.toString().padLeft(2, '0')}-'
      '${value.day.toString().padLeft(2, '0')}';

  @override
  DateTime fromSql(String fromDb) {
    final parts = fromDb.split('-');
    return DateTime.utc(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  @override
  String toSql(DateTime value) => format(value);
}

/// Stores a Dart enum as its snake_case name (`mixedUse` -> `mixed_use`), so
/// database values stay readable and match the data-model reference.
class SnakeCaseEnumConverter<T extends Enum> extends TypeConverter<T, String> {
  const SnakeCaseEnumConverter(this.values);

  final List<T> values;

  @override
  T fromSql(String fromDb) => values.firstWhere(
    (value) => toSql(value) == fromDb,
    orElse: () => throw StateError('Unknown $T value "$fromDb" in database'),
  );

  @override
  String toSql(T value) => value.name.replaceAllMapped(
    RegExp('[A-Z]'),
    (match) => '_${match[0]!.toLowerCase()}',
  );
}
