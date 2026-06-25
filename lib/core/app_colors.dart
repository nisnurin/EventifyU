import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF7A4DFF);
  static const Color secondary = Color(0xFFB35BEA);
  static const Color lightPurple = Color(0xFFF1E6FF);
  static const Color lavender = Color(0xFFEDE4FF);
  static const Color background = Color(0xFFF7F7FB);
  static const Color white = Colors.white;
  static const Color textDark = Color(0xFF1E1B39);
  static const Color textGrey = Color(0xFF8C8CA1);
  static const Color border = Color(0xFFE8E8F2);
  static const Color danger = Color(0xFFF44336);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient headerGradient = LinearGradient(
    colors: [Color(0xFF6E42F5), Color(0xFF8F60FF), Color(0xFFF5F1FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
