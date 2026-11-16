import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/database/app_database.dart';

void main() {
  test('opens with foreign key enforcement enabled', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    final row = await db.customSelect('PRAGMA foreign_keys').getSingle();
    expect(row.read<int>('foreign_keys'), 1);
  });
}
