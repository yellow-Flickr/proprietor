import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proprietor/src/dashboard.dart';
import 'package:proprietor/src/auth/forgot_password.dart';
import 'package:proprietor/src/auth/log_in.dart';
import 'package:proprietor/src/auth/sign_up.dart';
import 'package:proprietor/src/dark_mode.dart';
import 'package:proprietor/src/light_mode.dart';
import 'package:proprietor/src/properties/add_property.dart';
import 'package:proprietor/src/properties/amenities.dart';
import 'package:proprietor/src/properties/maintenance.dart';
import 'package:proprietor/src/properties/property_detail.dart';
import 'package:proprietor/src/properties/property_list.dart';
import 'package:proprietor/src/tenancy/add_tenant.dart';
import 'package:proprietor/src/tenancy/tenant_list.dart';
import 'package:sizer/sizer.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return Sizer(builder: (context, orientation, deviceTypes) {
      return ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
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

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case SampleItemDetailsView.routeName:
                      return const SampleItemDetailsView();
                    case SampleItemListView.routeName:
                      return const SampleItemListView();
                    case Dashboard.routeName:
                      return const Dashboard();
                    case SignUp.routeName:
                      return const SignUp();
                    case ForgotPassword.routeName:
                      return const ForgotPassword();
                    case AddProperty.routeName:
                      return const AddProperty();
                    case PropertyList.routeName:
                      return const PropertyList();
                    case PropertyDetail.routeName:
                      return const PropertyDetail();
                    case Amenities.routeName:
                      return const Amenities();
                    case Maintenance.routeName:
                      return const Maintenance();
                    case AddTenant.routeName:
                      return const AddTenant();
                    case TenantList.routeName:
                      return const TenantList();
                    case LogIn.routeName:
                    default:
                      return const LogIn();
                  }
                },
              );
            },
          );
        },
      );
    });
  }
}
