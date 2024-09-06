import 'package:flutter/material.dart';

const surface = Color(0xfffafafa);

var theme = ThemeData(
  colorScheme: const ColorScheme(
    surface: surface,
    onSurface: Colors.black,
    brightness: Brightness.light,
    primary: Colors.orangeAccent,
    onPrimary: Colors.black,
    secondary: Color(0xfffdf6d7),
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
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
    focusColor: Colors.orangeAccent,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey[200]!, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.orangeAccent, width: 2),
    ),
    contentPadding: const EdgeInsets.all(14),
  ),
  useMaterial3: false,
);