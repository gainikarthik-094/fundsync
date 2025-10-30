import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Global app color palette
class AppColors {
  static const Color primaryColor = Color(0xFF1565C0); // blue
  static const Color accentColor = Color(0xFF00BCD4); // cyan
  static const Color backgroundColor = Color(0xFFF5F7FA);
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF333333);
  static const Color subtitleColor = Color(0xFF777777);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFFB300);
}

/// Central theme configuration
ThemeData buildFundSyncTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 2,
      titleTextStyle: GoogleFonts.spaceGrotesk(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.spaceGrotesk(
        color: AppColors.textColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        color: AppColors.textColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.ptSans(
        color: AppColors.textColor,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.ptSans(
        color: AppColors.subtitleColor,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.ptSans(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardColor: AppColors.cardColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      hintStyle: GoogleFonts.ptSans(color: Colors.grey[500]),
      labelStyle: GoogleFonts.ptSans(color: AppColors.textColor),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey[500],
      selectedLabelStyle: GoogleFonts.ptSans(fontWeight: FontWeight.w600),
    ),
  );
}
