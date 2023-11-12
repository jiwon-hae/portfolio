import 'package:flutter/material.dart';
import 'color_scheme.dart' as my_color;
import 'text_theme.dart';

class MyTheme {
  const MyTheme._();

  static ThemeData light = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: 'Barlow',
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: my_color.ColorScheme.light);

  static ThemeData dark = ThemeData(
      useMaterial3: true,
      fontFamily: 'Barlow',
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        color: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: my_color.ColorScheme.light);
}
