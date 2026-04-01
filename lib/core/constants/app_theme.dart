import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

/// Application theme configuration
/// Defines light and dark themes with consistent styling
class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        surfaceTintColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lexend',
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: AppColors.black,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: AppColors.black,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColors.black,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColors.black,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.black,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.black,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.black,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: AppColors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Lexend',
          fontSize: 16,
          color: AppColors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Lexend',
          fontSize: 14,
          color: AppColors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Lexend',
          fontSize: 12,
          color: AppColors.black,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Lexend',
          fontSize: 14,
          color: AppColors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Lexend',
          fontSize: 12,
          color: AppColors.black,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Lexend',
          fontSize: 10,
          color: AppColors.black,
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Card Theme
      cardTheme: const CardThemeData(
        color: AppColors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.offWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.gray.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  // Dark Theme (placeholder for future implementation)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkGray,
    );
  }

  // Private constructor to prevent instantiation
  AppTheme._();
}
