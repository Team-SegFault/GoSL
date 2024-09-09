import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final CustomButtonStyles style;

  final Function()? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style = CustomButtonStyles.primary,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: TextButton.styleFrom(
        backgroundColor:
            style == CustomButtonStyles.primary ? Theme.of(context).colorScheme.primary : const Color(0xFFFFF6D6),
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          side: style == CustomButtonStyles.secondary
              ? BorderSide(color: Theme.of(context).colorScheme.primary)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.urbanist(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
enum CustomButtonStyles { primary, secondary, danger }
