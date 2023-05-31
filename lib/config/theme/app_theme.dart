import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.primary,
          primary: AppColors.grey,
        ),
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          surfaceTintColor: AppColors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'MuseoSans',
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'MuseoSans',
            fontWeight: FontWeight.w500,
          ),
        ).apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      );
}
