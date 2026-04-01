import 'package:flutter/material.dart';

/// Application color palette
/// Follows Material Design 3 guidelines
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1A91E5);
  static const Color secondary = Color(0xFFE8EDF2);
  static const Color tertiary = Color(0xFF4F7896);
  static const Color quaternary = Color.fromARGB(255, 222, 238, 250);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF2F2F2);
  static const Color gray = Color.fromARGB(255, 189, 189, 189);
  static const Color darkGray = Color(0xFF444444);
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  // Accent Colors
  static const Color purple = Color(0xFF5E4D99);
  static const Color lightGreen = Color(0xFFE8F2E8);
  static const Color green = Color(0xFF4CAF50);
  static const Color red = Color(0xFFF44336);
  static const Color redAccent = Color(0xFFFF5252);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, tertiary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Private constructor to prevent instantiation
  AppColors._();
}
