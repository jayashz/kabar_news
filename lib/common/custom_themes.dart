import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(24, 119, 242, 1),
    scaffoldBackgroundColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(Color.fromRGBO(24, 119, 242, 1)),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFFFFFFFF),
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        color: Color(0xFF4E4B66),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(24, 119, 242, 1),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color.fromRGBO(24, 119, 242, 1),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(24, 119, 242, 1),
    scaffoldBackgroundColor: Colors.black,
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Color.fromRGBO(24, 119, 242, 1)),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE4E6EB),
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFF4E4B66),
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFFFFFFFF),
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        color: Color(0xFFB0B3B8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(24, 119, 242, 1),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color.fromRGBO(24, 119, 242, 1),
        textStyle: const TextStyle(letterSpacing: 0.12),
      ),
    ),
  );
}
