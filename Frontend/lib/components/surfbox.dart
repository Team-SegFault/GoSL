import 'dart:ui'; // Import for using BackdropFilter
import 'package:flutter/material.dart';

class SurfBox extends StatelessWidget {

  final String imagePath;
  final String text1;
  final String text2;

  const SurfBox({
    super.key,
    required this.imagePath,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX:15, sigmaY:15),

            child: Container(
              height: 200,
              width: 171,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white60, Colors.white10],
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: Colors.white30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),  // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/surf/leapord.jpg',
                        width: 150,
                        height: 119,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    child: Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text1,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            text2,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(
  const MaterialApp(
    home: SurfBox(
      imagePath: 'assets/surf/leapord.jpg',
      text1: 'kotiya',
      text2: 'pulliya',
    ),
  ),
);
