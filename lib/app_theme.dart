import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0E0E0E);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFEE403D);
}

ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.red,
      onPrimary: AppColors.white,
      surface: AppColors.background,
      onSurface: AppColors.white,
    ),
    textTheme: base.textTheme.copyWith(
      headlineLarge: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    ),
  );
}
