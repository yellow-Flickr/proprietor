import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData lightMode = ThemeData(
  // brightness: Brightness.light,
  colorScheme: lightScheme,
  brightness: lightScheme.brightness,

  scaffoldBackgroundColor: lightScheme.surface,
  canvasColor: lightScheme.surface,

  // ColorScheme.light(
  //     surfaceBright: const Color(0xffF8F8F8),
  //     surface: const Color(0xFFF8F8F8),
  //     primaryContainer: Colors.grey.shade200,
  //     inversePrimary: const Color(0xFF3A855E),
  //     tertiary: Colors.grey,
  //     secondary: const Color(0xFFF9BC60), // icons
  //     primary: const Color(0xFF093634) // buttons and actions keys
  //     // inversePrimary: const Color(0xFF093634) // buttons and actions keys
  //     ),

  // scaffoldBackgroundColor: const Color(0xffF8F8F8),
  highlightColor: Colors.grey.shade200,
  // buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF093634)),
  listTileTheme: ListTileThemeData(
      horizontalTitleGap: 1.w,
      dense: true,
      visualDensity: VisualDensity.compact),
  checkboxTheme: CheckboxThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF093634);
        }
        return Colors.transparent;
      }),
      side: BorderSide(
        color: Colors.grey.shade400,
        width: 2,
      )),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightScheme.primary, foregroundColor: Colors.white),
  radioTheme: RadioThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF093634);
      }
      return Colors.grey.shade400;
    }),
  ),
  // switchTheme: SwitchThemeData(
  //   trackColor:
  //       WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return const Color(0xFF093634);
  //     }
  //     return Colors.grey.shade300;
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
  //   indicatorColor: Color(0xFF093634),
  // ),

  // segmentedButtonTheme: SegmentedButtonThemeData(
  //   style: ButtonStyle(
  //     shape: WidgetStatePropertyAll<OutlinedBorder>(
  //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
  //     backgroundColor: WidgetStateProperty.resolveWith<Color?>(
  //       (Set<WidgetState> states) {
  //         if (states.contains(WidgetState.pressed)) {
  //           return const Color(0xFF093634);
  //         }
  //         return null;
  //       },
  //     ),
  //   ),
  // ),

  appBarTheme: AppBarTheme(
    // systemOverlayStyle: Sys,
    foregroundColor: Colors.white,
    backgroundColor: lightScheme.primary,
    titleTextStyle: lightTextTheme.labelSmall,
    elevation: 0,

    // shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))),
    centerTitle: false,
    // titleTextStyle: TextStyle(
    //      fontSize: 1.7.h,
    //     fontWeight: FontWeight.w700,
    //     fontFamily: 'NotoSans'),
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: lightTextTheme.labelSmall,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: lightTextTheme.labelSmall,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  textTheme: lightTextTheme,
  dividerTheme: const DividerThemeData(color: Colors.grey),
);
final TextTheme lightTextTheme = ThemeData.light().textTheme.apply(
    bodyColor: lightScheme.onSurface,
    displayColor: lightScheme.onSurface,
    fontFamily: 'NotoSans');

const ColorScheme lightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff006876),
  surfaceTint: Color(0xff006876),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffa0efff),
  onPrimaryContainer: Color(0xff001f25),
  secondary: Color(0xff4a6267),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffcde7ed),
  onSecondaryContainer: Color(0xff051f23),
  tertiary: Color(0xff545d7e),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffdbe1ff),
  onTertiaryContainer: Color(0xff101a37),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  surface: Color(0xfff5fafc),
  onSurface: Color(0xff171d1e),
  onSurfaceVariant: Color(0xff3f484a),
  outline: Color(0xff6f797b),
  outlineVariant: Color(0xffbfc8ca),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2b3133),
  inversePrimary: Color(0xff82d3e3),
  primaryFixed: Color(0xffa0efff),
  onPrimaryFixed: Color(0xff001f25),
  primaryFixedDim: Color(0xff82d3e3),
  onPrimaryFixedVariant: Color(0xff004e59),
  secondaryFixed: Color(0xffcde7ed),
  onSecondaryFixed: Color(0xff051f23),
  secondaryFixedDim: Color(0xffb1cbd1),
  onSecondaryFixedVariant: Color(0xff334b4f),
  tertiaryFixed: Color(0xffdbe1ff),
  onTertiaryFixed: Color(0xff101a37),
  tertiaryFixedDim: Color(0xffbcc5eb),
  onTertiaryFixedVariant: Color(0xff3c4665),
  surfaceDim: Color(0xffd5dbdc),
  surfaceBright: Color(0xfff5fafc),
  surfaceContainerLowest: Color(0xffffffff),
  surfaceContainerLow: Color(0xffeff5f6),
  surfaceContainer: Color(0xffe9eff0),
  surfaceContainerHigh: Color(0xffe3e9eb),
  surfaceContainerHighest: Color(0xffdee3e5),
);
