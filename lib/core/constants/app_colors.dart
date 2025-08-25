import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryValue = 0xFF3C82F7;

  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFE7F0FE),
      100: Color(0xFFC3DAFD),
      200: Color(0xFF9BC3FB),
      300: Color(0xFF73ABFA),
      400: Color(0xFF5598F9),
      500: Color(_primaryValue), // main color
      600: Color(0xFF3675E0),
      700: Color(0xFF2F67C7),
      800: Color(0xFF2859AD),
      900: Color(0xFF1B3F7F),
    },
  );
  static const Color primary = Color(0xFF0C77F2);
  static const Color secondary = Color(0xFFF2F7FF);
  static const Color background = Color(0xFFF9F9FB);

  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);

  static const Color accent = Color(0xFFE0F2FE);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFEF4444);
}
