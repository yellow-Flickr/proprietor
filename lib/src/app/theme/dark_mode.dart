import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkScheme,

  scaffoldBackgroundColor: darkScheme.surface,
  canvasColor: darkScheme.surface,

  // ColorScheme.dark(
  //     surface: Colors.grey.shade900,
  //     primaryContainer: Colors.grey.shade800,
  //     primary: const Color(0xFFB6E1FF),
  //     tertiary: Colors.white,
  //     secondary: const Color(0xFF75A1D9), // icons
  //     inversePrimary: const Color(0xFF336699) // buttons and actions keys
  //     ),
  highlightColor: Colors.grey.shade800,
  // c
  // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF336699)),
  // checkboxTheme: const CheckboxThemeData(
  //     side: BorderSide(color: Color(0xFF336699), width: 2)),
  // radioTheme: RadioThemeData(
  //   fillColor:
  //       WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  //     // if (states.contains(WidgetState.selected)) {
  //     //   return Color(0xFF480674);
  //     // }
  //     return const Color(0xFF336699);
  //   }),
  // ),
  // switchTheme: SwitchThemeData(
  //   trackColor:
  //       WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return const Color(0xFF336699);
  //     }
  //     return Colors.grey.shade700;
  //   }),
  //   thumbColor:
  //       WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Colors.white;
  //     }
  //     return Colors.grey;
  //   }),
  //   trackOutlineColor: WidgetStateProperty.all<Color>(Colors.transparent),
  // ),
  // tabBarTheme: const TabBarTheme(
  //   labelColor: Colors.white,
  //   unselectedLabelColor: Colors.white60,
  //   indicatorColor: Color(0xFF336699),
  // ),
  // appBarTheme: AppBarTheme(
  //   foregroundColor: Colors.white,
  //   backgroundColor: Colors.grey.shade800,
  //   titleTextStyle: TextStyle(
  //       color: Colors.white,
  //       fontSize: 1.7.h,
  //       fontWeight: FontWeight.w700,
  //       fontFamily: 'Montserrat'),
  // ),
  textTheme: ThemeData.light().textTheme.apply(
      bodyColor: darkScheme.onSurface,
      displayColor: darkScheme.onSurface,
      fontFamily: 'NotoSans'),
  dividerTheme: DividerThemeData(color: Colors.grey[200]),
);

const ColorScheme darkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffa7c8ff),
  surfaceTint: Color(0xffa7c8ff),
  onPrimary: Color(0xff03305f),
  primaryContainer: Color(0xff234777),
  onPrimaryContainer: Color(0xffd5e3ff),
  secondary: Color(0xffbdc7dc),
  onSecondary: Color(0xff273141),
  secondaryContainer: Color(0xff3d4758),
  onSecondaryContainer: Color(0xffd9e3f8),
  tertiary: Color(0xffdbbde2),
  onTertiary: Color(0xff3e2845),
  tertiaryContainer: Color(0xff553f5d),
  onTertiaryContainer: Color(0xfff8d8ff),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffdad6),
  surface: Color(0xff111318),
  onSurface: Color(0xffe1e2e9),
  onSurfaceVariant: Color(0xffc4c6cf),
  outline: Color(0xff8d9199),
  outlineVariant: Color(0xff43474e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffe1e2e9),
  inversePrimary: Color(0xff3d5f90),
  primaryFixed: Color(0xffd5e3ff),
  onPrimaryFixed: Color(0xff001c3b),
  primaryFixedDim: Color(0xffa7c8ff),
  onPrimaryFixedVariant: Color(0xff234777),
  secondaryFixed: Color(0xffd9e3f8),
  onSecondaryFixed: Color(0xff121c2b),
  secondaryFixedDim: Color(0xffbdc7dc),
  onSecondaryFixedVariant: Color(0xff3d4758),
  tertiaryFixed: Color(0xfff8d8ff),
  onTertiaryFixed: Color(0xff27132f),
  tertiaryFixedDim: Color(0xffdbbde2),
  onTertiaryFixedVariant: Color(0xff553f5d),
  surfaceDim: Color(0xff111318),
  surfaceBright: Color(0xff37393e),
  surfaceContainerLowest: Color(0xff0c0e13),
  surfaceContainerLow: Color(0xff191c20),
  surfaceContainer: Color(0xff1d2024),
  surfaceContainerHigh: Color(0xff282a2f),
  surfaceContainerHighest: Color(0xff32353a),
);
