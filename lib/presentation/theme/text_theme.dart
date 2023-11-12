import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FontWeight _semiBold = FontWeight.w600;

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.barlow(fontSize: 54, fontWeight: FontWeight.bold),
  displayMedium: GoogleFonts.barlow(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  ),
  displaySmall: GoogleFonts.barlow(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
  headlineLarge: TextStyle(
    fontSize: 25.0,
    fontWeight: _semiBold,
  ),
  headlineMedium: TextStyle(
    fontSize: 20.0,
    fontWeight: _semiBold,
  ),
  headlineSmall: GoogleFonts.barlow(fontSize: 17.0, fontWeight: _semiBold),
  titleLarge: GoogleFonts.barlow(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.barlow(
    fontSize: 22.0,
    fontWeight: FontWeight.normal,
  ),
  titleSmall: GoogleFonts.barlow(
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
  ),
  bodyLarge: GoogleFonts.barlowSemiCondensed(
    fontSize: 17.0,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: GoogleFonts.barlowSemiCondensed(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  ),
  bodySmall: GoogleFonts.barlowSemiCondensed(
    fontSize: 13.0,
    fontWeight: FontWeight.normal,
  ),
  labelLarge: GoogleFonts.barlowCondensed(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  ),
  labelMedium: GoogleFonts.barlowCondensed(
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
  ),
  labelSmall: GoogleFonts.barlowCondensed(
    fontSize: 8.0,
    fontWeight: FontWeight.normal,
  ),
);
