import 'package:flutter/material.dart';

var theme = ThemeData(
  colorScheme: const ColorScheme(
    surface: Color(0xfffafafa),
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
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  useMaterial3: false,
);