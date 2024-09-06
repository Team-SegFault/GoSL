import 'package:GOSL/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_stepper/easy_stepper.dart';

class InitOnBoarding extends StatelessWidget {
  const InitOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onBoarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              // Dark gradient background at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  heightFactor: screenHeight < 700
                      ? 0.5
                      : 2 / 5, // Adjust based on screen height
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Logo at the top
                  const Image(
                    image: AssetImage('assets/images/Ayubowan.png'),
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth *
                          0.1, // Adjust text padding based on screen width
                      vertical: 20.0,
                    ),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text:
                            'Meaning “Wish you a long life” and this is how we greet here in ',
                        style: GoogleFonts.poppins(
                            fontSize:
                                screenWidth * 0.04, // Make text size responsive
                            fontWeight: FontWeight.w300,
                            color: const Color(0xffDEDEDE)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sri Lanka.',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Stepper, Logo, and Skip button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: screenWidth *
                            0.23, // Make container width responsive
                        child: Stepper(),
                      ),
                      const Logo(fontSize: 20),
                      TextButton(
                        onPressed: () {
                          // Navigate to the home page
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.04, // Adjust button text size
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {

final String backgroundImage;
final Color gradColor1;
final Color gradColor2;
final String title;
final String description;

  const OnBoarding({super.key, required this.backgroundImage, required this.gradColor1, required this.gradColor2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onBoarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              // Dark gradient background at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  heightFactor: 2 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Logo at the top
                  const Image(
                    image: AssetImage('assets/images/Ayubowan.png'),
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text:
                            'Meaning “Wish you a long life” and this is how we greet here in ',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w300),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sri Lanka.',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Stepper, Logo, and Skip button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        child: Stepper(),
                      ),
                      const Logo(fontSize: 20),
                      TextButton(
                        onPressed: () {
                          // Navigate to the home page
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Stepper extends StatelessWidget {
  const Stepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}
