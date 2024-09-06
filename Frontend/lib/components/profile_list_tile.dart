import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key, required this.title, required this.icon, this.onPressed});

  final void Function()? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed ?? () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xFFD9D9D9)), borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
              HugeIcon(icon: icon, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
