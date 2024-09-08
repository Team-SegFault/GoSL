import 'package:flutter/material.dart';
import 'package:GOSL/components/surfbox.dart'; // Import your SurfBox component

class DescriptionCard extends StatefulWidget {
  final String backgroundImage;
  final String title;
  final String description;
  final String extendedDescription;

  const DescriptionCard({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.extendedDescription,
  });

  @override
  _DescriptionCardState createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  bool _isExpanded = false; // Track whether the text is expanded

  void _toggleReadMore() {
    setState(() {
      _isExpanded = !_isExpanded; // Toggle the expanded state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensure the stack fills the entire screen
        children: [
          // Zoomed background image
          Positioned.fill(
            child: Image.asset(
              widget.backgroundImage, // Use the background image from parameters
              fit: BoxFit.cover, // Ensure the image covers the screen
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
              height: _isExpanded ? MediaQuery.of(context).size.height * 0.8 : 500, // Adjust height based on expanded state
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(_isExpanded ? 0.9 : 0.8)], // Increased opacity when expanded
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Main content
          Positioned(
            bottom: 75, // Position the text 200 pixels from the bottom
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.centerLeft, // Align text to the left
              child: Padding(
                padding: EdgeInsets.all(16.0), // Add some padding if needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                  children: [
                    Text(
                      widget.title, // Use the title from parameters
                      style: TextStyle(
                        fontFamily: 'Big Squirrel',
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8), // Add space between title and description
                    Text(
                      widget.description, // Use the description from parameters
                      style: TextStyle(
                        fontFamily: 'Big Squirrel',
                        fontSize: 16,
                        color: Colors.white70, // Lighter text color
                      ),
                    ),
                    if (_isExpanded) ...[
                      SizedBox(height: 8), // Add space before the additional text
                      Text(
                        widget.extendedDescription, // Use the extended description from parameters
                        style: TextStyle(
                          fontFamily: 'Big Squirrel',
                          fontSize: 16,
                          color: Colors.white70, // Lighter text color
                        ),
                      ),
                    ],
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: _toggleReadMore,
                      child: Text(
                        _isExpanded ? 'Show less' : 'Read more',
                        style: TextStyle(
                          fontFamily: 'Big Squirrel',
                          fontSize: 16,
                          color: Colors.white, // Color of the "Read more" or "Show less" text
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
