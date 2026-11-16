import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app/app.dart';
import 'src/features/settings/data/settings_service.dart';
import 'src/features/settings/presentation/settings_controller.dart';

/// Composition root: app-wide dependencies are created and wired here.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  final settingsService = SettingsService();
  final initialThemeMode = await settingsService.themeMode();

  runApp(
    ProviderScope(
      overrides: [
        settingsServiceProvider.overrideWithValue(settingsService),
        initialThemeModeProvider.overrideWithValue(initialThemeMode),
      ],
      child: const MyApp(),
    ),
  );
}
