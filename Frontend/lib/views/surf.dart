import 'package:flutter/material.dart';
import 'package:GOSL/components/surfbox.dart'; // Import your SurfBox component
import 'animal_surf.dart';
import 'food_surf.dart';
import 'place_surf.dart';
import 'event_surf.dart';

class SurfPage extends StatelessWidget {
  // Define a list of configurations for SurfBox
  final List<Map<String, String>> surfBoxData = [
    {'imagePath': 'assets/surf/places_surf/Sigiriya.jpg', 'text1': 'Sights', 'text2': 'to take your breath away'},
    {'imagePath': 'assets/surf/leapord.jpg', 'text1': 'Wild Life', 'text2': 'diverse and wonderful'},
    {'imagePath': 'assets/surf/event_surf/Kirimadu.jpg', 'text1': 'Events', 'text2': 'nowhere else to see'},
    {'imagePath': 'assets/surf/food_surf/kottu.jpg', 'text1': 'Spicy Food', 'text2': 'awaken your tastebuds'},
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10), // Reduced space between rows
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SurfBox(
                            imagePath: surfBoxData[0]['imagePath']!,
                            text1: surfBoxData[0]['text1']!,
                            text2: surfBoxData[0]['text2']!,
                            destinationPage: PlacesSurf(),
                          ),
                        ),
                          SizedBox(width: 10), // Add spacing between columns
                          Expanded(
                            child: SurfBox(
                              imagePath: surfBoxData[1]['imagePath']!,
                              text1: surfBoxData[1]['text1']!,
                              text2: surfBoxData[1]['text2']!,
                              destinationPage: AnimalSurf(),
                            ),
                          ),  
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10), // Reduced space between rows
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SurfBox(
                            imagePath: surfBoxData[2]['imagePath']!,
                            text1: surfBoxData[2]['text1']!,
                            text2: surfBoxData[2]['text2']!,
                            destinationPage: EventSurf(),
                          ),
                        ),
                          SizedBox(width: 10), // Add spacing between columns
                          Expanded(
                            child: SurfBox(
                              imagePath: surfBoxData[3]['imagePath']!,
                              text1: surfBoxData[3]['text1']!,
                              text2: surfBoxData[3]['text2']!,
                              destinationPage: FoodSurf(),
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
