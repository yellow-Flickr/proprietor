import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/core/domain/domain_exception.dart';

import '../../helpers/test_app.dart';

void main() {
  late TestApp app;

  setUp(() => app = TestApp());

  test('creates a single local profile defaulting to GHS', () async {
    final profile = await app.profiles.createProfile(
      displayName: '  Ama Owusu ',
      email: ' ',
    );

    expect(profile.displayName, 'Ama Owusu');
    expect(profile.defaultCurrency, 'GHS');
    expect(profile.email, isNull);
    expect((await app.profiles.getProfile())?.id, profile.id);
    expect(
      () => app.profiles.createProfile(displayName: 'Second'),
      throwsA(isA<ConflictException>()),
    );
  });

  test('rejects an invalid currency code', () {
    expect(
      () => app.profiles.createProfile(
        displayName: 'Ama',
        defaultCurrency: 'cedi',
      ),
      throwsA(isA<ValidationException>()),
    );
  });
}
