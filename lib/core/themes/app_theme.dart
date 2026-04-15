import 'package:edumate/core/themes/conts_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF4A90E2),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(ConstsColors.koffwhite) ,
      foregroundColor: Colors.black, // icons & title color
      elevation: 0, // optional: flat modern look
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black54),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black45),
    ),

    cardColor: Colors.white,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFFE94A4A),
    ),
  );
  // Dark theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1E88E5), // da,rker blue
    scaffoldBackgroundColor: const Color(
      ConstsColors.kmaindarkcolor,
    ), // light gray background
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E88E5),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white60),
    ),

    cardColor: const Color(0xFF1E1E1E), // dark card color
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF1E88E5),
      secondary: const Color(0xFFE94A4A), // accent color
    ),
  );
}
// Theme.of(context).brightness == Brightness.light