import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Colors.red;
  static const backgroundLight = Color.fromARGB(255, 251, 248, 248);
  static const backgroundDark = Color.fromARGB(255, 20, 20, 20);

  static ColorScheme fromBrightness({required Brightness brightness}) {
    return ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: primaryColor,
      // Customisation goes here
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        background: backgroundLight,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        background: backgroundDark,
      ),
    );
  }
}
