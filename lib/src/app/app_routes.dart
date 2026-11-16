import 'package:flutter/material.dart';
import 'package:proprietor/src/features/auth/presentation/forgot_password.dart';
import 'package:proprietor/src/features/auth/presentation/log_in.dart';
import 'package:proprietor/src/features/auth/presentation/sign_up.dart';
import 'package:proprietor/src/features/dashboard/presentation/dashboard.dart';
import 'package:proprietor/src/features/properties/presentation/add_property.dart';
import 'package:proprietor/src/features/properties/presentation/amenities.dart';
import 'package:proprietor/src/features/properties/presentation/maintenance.dart';
import 'package:proprietor/src/features/properties/presentation/property_detail.dart';
import 'package:proprietor/src/features/properties/presentation/property_list.dart';
import 'package:proprietor/src/features/settings/presentation/settings_view.dart';
import 'package:proprietor/src/features/tenants/presentation/add_tenant.dart';
import 'package:proprietor/src/features/tenants/presentation/tenant_list.dart';

class AppRoutes {
  const AppRoutes._();

  static Route<dynamic> generate(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case SettingsView.routeName:
            return const SettingsView();
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
  }
}
