import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  ///  Add all themes used across the app here ...
  static final englishAppTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    iconTheme: iconTheme,
    scaffoldBackgroundColor: AppColors.white,
    primaryIconTheme: iconTheme,
    hintColor: Colors.transparent,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.red,
      errorColor: AppColors.errorColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor),
      displayMedium: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor),
      displaySmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor),
      titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textColor),
      labelLarge: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textColor),
      bodyLarge: TextStyle(fontSize: 14.0, color: AppColors.textColor),
    ),
  );

  static const iconTheme = IconThemeData(color: AppColors.red);
}
