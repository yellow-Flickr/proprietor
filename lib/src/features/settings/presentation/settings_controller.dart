import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/settings_service.dart';

/// The ThemeMode loaded from [SettingsService] before the first frame.
///
/// Must be overridden in the root `ProviderScope` (see `main.dart`) so the app
/// starts with the user's preferred theme instead of flashing a default one.
final initialThemeModeProvider = Provider<ThemeMode>(
  (ref) => throw UnimplementedError(
    'initialThemeModeProvider must be overridden in the root ProviderScope',
  ),
);

/// Holds the user's preferred [ThemeMode] and persists changes through
/// [SettingsService].
class SettingsController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ref.read(initialThemeModeProvider);

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == state) return;

    // Update in memory first so the UI reacts immediately, then persist.
    state = newThemeMode;
    await ref.read(settingsServiceProvider).updateThemeMode(newThemeMode);
  }
}

final settingsControllerProvider =
    NotifierProvider<SettingsController, ThemeMode>(SettingsController.new);
