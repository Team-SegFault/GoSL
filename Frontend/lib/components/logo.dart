import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final double fontSize; // Add a fontSize parameter

  const Logo({super.key, required this.fontSize}); // Initialize fontSize in the constructor

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '🇱🇰 Go',
          style: GoogleFonts.poppins(
            fontSize: fontSize, // Use the passed fontSize
            fontWeight: FontWeight.w500,
            color: const Color(0xFFF7C04A),
          ),
        ),
        Text(
          'SL',
          style: GoogleFonts.poppins(
            fontSize: fontSize, // Use the passed fontSize
            fontWeight: FontWeight.w700,
            color: const Color(0xFFF7C04A),
          ),
        ),
      ],
    );
  }
}
