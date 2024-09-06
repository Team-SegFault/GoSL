import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.title, required this.imgPath});

  final String title;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 3.8,
            // width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              // color: Colors.blue,
              image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 12,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.245,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
