import 'package:flutter/material.dart';

import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.purple,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.cream,
    cardColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.dark),
      bodyLarge: TextStyle(color: AppColors.dark),
      titleLarge: TextStyle(color: AppColors.dark, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: AppColors.dark),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.cream,
      foregroundColor: AppColors.dark,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.purple,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.grayBlack,
    cardColor: Colors.black,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.gray[200]),
      bodyLarge: TextStyle(color: AppColors.gray[200]),
      titleLarge: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: AppColors.gray[300]),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
