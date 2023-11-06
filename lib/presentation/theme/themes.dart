import 'package:flutter/material.dart';
import 'color_scheme.dart' as my_color;
class MyTheme {
  const MyTheme._();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme:_getTextTheme(),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: my_color.ColorScheme.light
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: _getTextTheme(),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: my_color.ColorScheme.light
  );

  static TextTheme _getTextTheme({Color textColor = Colors.black}) {
    return TextTheme(
      displayLarge: TextStyle(
          fontSize: 36.0, fontWeight: FontWeight.bold, color: textColor),
      displayMedium: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodySmall: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
      labelLarge: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelMedium: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelSmall: const TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
    );
  }
}
