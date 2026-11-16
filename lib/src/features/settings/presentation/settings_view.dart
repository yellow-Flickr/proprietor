import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, [SettingsController] updates its state and
/// widgets watching [settingsControllerProvider] (including the MaterialApp)
/// are rebuilt.
class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(settingsControllerProvider);
    final controller = ref.read(settingsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: themeMode,
          onChanged: controller.updateThemeMode,
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark Theme')),
          ],
        ),
      ),
    );
  }
}
