import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proprietor/src/features/settings/data/settings_service.dart';
import 'package:proprietor/src/features/settings/presentation/settings_controller.dart';

class _RecordingSettingsService extends SettingsService {
  final saved = <ThemeMode>[];

  @override
  Future<void> updateThemeMode(ThemeMode theme) async => saved.add(theme);
}

void main() {
  late _RecordingSettingsService service;
  late ProviderContainer container;

  ProviderContainer makeContainer(ThemeMode initial) {
    final c = ProviderContainer(
      overrides: [
        settingsServiceProvider.overrideWithValue(service),
        initialThemeModeProvider.overrideWithValue(initial),
      ],
    );
    addTearDown(c.dispose);
    return c;
  }

  setUp(() => service = _RecordingSettingsService());

  test('starts with the pre-loaded theme mode', () {
    container = makeContainer(ThemeMode.dark);
    expect(container.read(settingsControllerProvider), ThemeMode.dark);
  });

  test('updates state and persists a new theme mode', () async {
    container = makeContainer(ThemeMode.system);
    await container
        .read(settingsControllerProvider.notifier)
        .updateThemeMode(ThemeMode.light);

    expect(container.read(settingsControllerProvider), ThemeMode.light);
    expect(service.saved, [ThemeMode.light]);
  });

  test('ignores null and unchanged selections', () async {
    container = makeContainer(ThemeMode.light);
    final controller = container.read(settingsControllerProvider.notifier);

    await controller.updateThemeMode(null);
    await controller.updateThemeMode(ThemeMode.light);

    expect(container.read(settingsControllerProvider), ThemeMode.light);
    expect(service.saved, isEmpty);
  });
}
