import 'package:GOSL/controllers/navbar_controller.dart';
import 'package:GOSL/views/favourites.dart';
import 'package:GOSL/views/home.dart';
import 'package:GOSL/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GOSL/components/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoSL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoarding(
        backgroundImage: 'assets/images/onBoarding1.png',
        title1: 'Sandy',
        title2: 'Beaches',
        description: 'Our beaches will remind you of paradise on earth.',
        gradColor1: Color(0xff006045),
        gradColor2: Color(0xff002017),
        buttonText: 'Skip',
      ),
    );
  }
}
