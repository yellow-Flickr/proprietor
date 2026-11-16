import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/app/app_routes.dart';
import 'package:proprietor/src/app/theme/dark_mode.dart';
import 'package:proprietor/src/app/theme/light_mode.dart';
import 'package:proprietor/src/core/localization/app_localizations.dart';
import 'package:proprietor/src/features/settings/presentation/settings_controller.dart';
import 'package:sizer/sizer.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Rebuild the MaterialApp whenever the user changes their theme setting.
    final themeMode = ref.watch(settingsControllerProvider);

    return Sizer(
      builder: (context, orientation, deviceTypes) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          theme: lightMode,
          darkTheme: darkMode,
          themeMode: themeMode,

          // Named routes support Flutter web url navigation and deep linking.
          onGenerateRoute: AppRoutes.generate,
        );
      },
    );
  }
}
