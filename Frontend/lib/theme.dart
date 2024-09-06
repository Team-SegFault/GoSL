import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
  colorScheme: const ColorScheme(
    surface: Color(0xfffafafa),
    onSurface: Colors.black,
    brightness: Brightness.light,
    primary: Color(0xFFF7C04A),
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
    backgroundColor: Color(0xfffafafa),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFF7C04A),
      padding: const EdgeInsets.all(14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFFF7C04A),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(14),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: Colors.black),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    focusColor: Color(0xFFF7C04A),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey[200]!, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFF7C04A), width: 2),
    ),
    contentPadding: const EdgeInsets.all(14),
  ),
  useMaterial3: false,
);