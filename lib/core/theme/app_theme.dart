import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Modelled after JetBrains New UI Dark theme (2023)
  static const Color background = Color(0xFF1E1F22);
  static const Color surface = Color(0xFF2B2D30);
  static const Color primary = Color(0xFF3574F0); // A standard blue common in IDEs
  static const Color text = Color(0xFFBCBEC4);
  static const Color textSecondary = Color(0xFF7C7E82);
  static const Color divider = Color(0xFF43454A);
  static const Color editorBackground = Color(0xFF1E1F22);
  static const Color editorGutter = Color(0xFF2B2D30);
  static const Color editorGutterText = Color(0xFF6F737A);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.surface,
        background: AppColors.background,
        onSurface: AppColors.text,
        onBackground: AppColors.text,
      ),
      dividerColor: AppColors.divider,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        iconTheme: IconThemeData(color: AppColors.textSecondary),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
      ),
    );
  }
}
