import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outline_button_theme.dart';
import 'custom_themes/bottom_navigationbar_theme.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._(); //private

  // ignore: non_constant_identifier_names
  static ThemeData LightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'poppins',
      brightness: Brightness.light,
      primaryColor: const Color.fromRGBO(30, 162, 109, 1),
      scaffoldBackgroundColor: Colors.grey[100],
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      chipTheme: TChipTheme.lightChipTheme,
      bottomNavigationBarTheme: TBottomNavBarTheme.lightBottomNavBarTheme);
  // ignore: non_constant_identifier_names
  static ThemeData DarkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'poppins',
      brightness: Brightness.dark,
      primaryColor: const Color.fromRGBO(30, 162, 109, 1),
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.dartInputDecorationTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      chipTheme: TChipTheme.darkChipTheme,
      bottomNavigationBarTheme: TBottomNavBarTheme.darkBottomNavBarTheme);
}
