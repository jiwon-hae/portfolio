import 'package:flutter/material.dart' as m3;

class ColorScheme {
  const ColorScheme._();

  static const m3.ColorScheme light = m3.ColorScheme(
      brightness: m3.Brightness.light,
      primary: m3.Color(0xFF5723ec),
      onPrimary: m3.Color(0xFF000000),
      secondary: m3.Color(0xFFE9A35B),
      onSecondary: m3.Color(0xFF000000),
      tertiary: m3.Color(0xFF61E8E4),
      onTertiary: m3.Color(0xFF000000),
      error: m3.Color(0xFFECC166),
      onError: m3.Color(0xFF342404),
      background: m3.Color(0xFFe2e2e3),
      onBackground: m3.Color(0xFFDDDBDC),
      surface: m3.Color(0xFFF0F4F4),
      onSurface: m3.Color(0xFF3C4041),
      primaryContainer: m3.Color(0xFF1d0c3b),
      onPrimaryContainer: m3.Color(0xFFe2e2e3)
  );


  static const m3.ColorScheme dark = m3.ColorScheme(
      brightness: m3.Brightness.dark,
      primary: m3.Color(0xFFA26CF0),
      onPrimary: m3.Color(0xFF000000),
      secondary: m3.Color(0xFFE9A35B),
      onSecondary: m3.Color(0xFF000000),
      tertiary: m3.Color(0xFF61E8E4),
      onTertiary: m3.Color(0xFF000000),
      error: m3.Color(0xFFECC166),
      onError: m3.Color(0xFF342404),
      background: m3.Color(0xFFF5F4F5),
      onBackground: m3.Color(0xFFDDDBDC),
      surface: m3.Color(0xFFF0F4F4),
      onSurface: m3.Color(0xFF3C4041)
  );
}