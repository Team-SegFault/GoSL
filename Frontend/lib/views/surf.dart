import 'package:flutter/material.dart';
import 'package:GOSL/components/surfbox.dart'; // Import your SurfBox component

class SurfPage extends StatelessWidget {
  // Define a list of configurations for SurfBox
  final List<Map<String, String>> surfBoxData = [
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'kotiya', 'text2': 'pulliya'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensure the stack fills the entire screen
        children: [
          // Zoomed background image
          Positioned.fill(
            child: Transform.scale(
              scale: 3.0, // Zoom level
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/surf/surfbg.png', // Your background image
                  fit: BoxFit.cover, // Ensure the image covers the screen
                ),
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.all(8.0), // Add padding around the grid
            child: Column(
              children: [
                SizedBox(height: 100),
                const Text(
                  'WHAT WOULD YOU LIKE TO KNOW?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20),
                for (int i = 0; i < surfBoxData.length; i += 2)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10), // Reduced space between rows
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SurfBox(
                            imagePath: surfBoxData[i]['imagePath']!,
                            text1: surfBoxData[i]['text1']!,
                            text2: surfBoxData[i]['text2']!,
                          ),
                        ),
                        if (i + 1 < surfBoxData.length)
                          SizedBox(width: 10), // Add spacing between columns
                        if (i + 1 < surfBoxData.length)
                          Expanded(
                            child: SurfBox(
                              imagePath: surfBoxData[i + 1]['imagePath']!,
                              text1: surfBoxData[i + 1]['text1']!,
                              text2: surfBoxData[i + 1]['text2']!,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Dark-to-transparent gradient rectangles at top and bottom
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150, // Adjust height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150, // Adjust height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
