import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const surface = Color(0xfffafafa);
const primary = Color(0xFFF7C04A);

var theme = ThemeData(
  colorScheme: const ColorScheme(
    surface: surface,
    onSurface: Colors.black,
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.black,
    secondary: Color(0xfffdf6d7),
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  ),
  textTheme: GoogleFonts.urbanistTextTheme().copyWith(
    titleLarge: GoogleFonts.playfairDisplay(),
    titleMedium: GoogleFonts.playfairDisplay(),
    titleSmall: GoogleFonts.playfairDisplay(),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: surface,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: Colors.black),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    focusColor: primary,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey[200]!, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: primary, width: 2),
    ),
    contentPadding: const EdgeInsets.all(14),
  ),
  useMaterial3: false,
);