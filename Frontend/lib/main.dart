import 'package:flutter/material.dart';
import 'package:GOSL/components/onboarding.dart';
import 'package:GOSL/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoSL',
      theme: theme,
      home: OnboardingPageView(),
    );
  }
}

class OnboardingPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        OnBoarding(
          backgroundImage: 'assets/images/onBoarding1.png',
          title1: 'Sandy',
          title2: 'Beaches',
          description: 'Our beaches will remind you of paradise on earth.',
          gradColor1: Color(0xff006045),
          gradColor2: Color(0xff002017),
          buttonText: 'Skip',
        ),
        OnBoarding(
          backgroundImage: 'assets/images/onBoarding2.png',
          title1: 'Rich',
          title2: 'History',
          description: 'Experience the remnants of the proud Sri Lankan history spanning over 2000 years',
          gradColor1: Color(0xff51432F),
          gradColor2: Color(0xff160D01),
          buttonText: 'Skip',
        ),
        OnBoarding(
          backgroundImage: 'assets/images/onBoarding3.png',
          title1: 'Great',
          title2: 'Food',
          description: 'Experience the remnants of the proud Sri Lankan history spanning over 2000 years',
          gradColor1: Color(0xff9C7960),
          gradColor2: Color(0xff231919),
          buttonText: 'Next',
        ),
        // Add more OnBoarding widgets here
      ],
    );
  }
}
