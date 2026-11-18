import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/domain/domain_exception.dart';
import 'package:proprietor/src/features/settings/domain/notification_preference.dart';

import '../../helpers/test_app.dart';

void main() {
  late TestApp app;
  late String landlordId;

  setUp(() async {
    app = TestApp();
    landlordId = (await app.profiles.createProfile(displayName: 'Ama')).id;
  });

  test('ensureDefaults creates one preference per event type, once', () async {
    final first = await app.notifications.ensureDefaults(landlordId);
    final second = await app.notifications.ensureDefaults(landlordId);

    expect(first, hasLength(NotificationEventType.values.length));
    expect(second.map((p) => p.id).toSet(), first.map((p) => p.id).toSet());
    expect(first.every((p) => p.enabled), isTrue);
  });

  test('updates enabled flag and lead time', () async {
    final rentDue = (await app.notifications.ensureDefaults(
      landlordId,
    )).firstWhere((p) => p.eventType == NotificationEventType.rentDue);

    await app.notifications.setEnabled(rentDue.id, false);
    final updated = await app.notifications.setDaysBefore(rentDue.id, 5);

    expect(updated.enabled, isFalse);
    expect(updated.daysBefore, 5);
    expect(
      () => app.notifications.setDaysBefore(rentDue.id, -1),
      throwsA(isA<ValidationException>()),
    );
  });
}
