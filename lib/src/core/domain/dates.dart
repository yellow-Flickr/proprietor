/// Business dates (due dates, tenancy start/end, ...) are represented as UTC
/// midnight [DateTime]s. Use this to normalise any input before comparing or
/// storing it.
DateTime dateOnly(DateTime value) =>
    DateTime.utc(value.year, value.month, value.day);
