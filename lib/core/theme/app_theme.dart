import 'package:flutter/material.dart';
import 'package:lms/core/constants/app_colors.dart';

class CustomAppTheme {
  /// Light theme
  static final ColorScheme _lightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: AppColors.primarySwatch,
    brightness: Brightness.light,
  );

  /// Dark theme
  static final ColorScheme _darkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: AppColors.primarySwatch,
    brightness: Brightness.dark,
  );

  /// Shared text theme
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  /// Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: _textTheme.apply(
      bodyColor: _lightColorScheme.onSurface,
      displayColor: _lightColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _lightColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
    ),
  );

  /// Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    textTheme: _textTheme.apply(
      bodyColor: _darkColorScheme.onSurface,
      displayColor: _darkColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _darkColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.primary,
      foregroundColor: _darkColorScheme.onPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkColorScheme.primary,
      foregroundColor: _darkColorScheme.onPrimary,
    ),
  );
}
