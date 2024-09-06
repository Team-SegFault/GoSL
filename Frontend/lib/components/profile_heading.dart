import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 37,
              backgroundColor: Color(0xFFD9D9D9),
              backgroundImage: AssetImage("assets/images/profile/Perry_the_Platypus.png"),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Perry",
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Semerang, Indonesia",
                  style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFFB3B3B3), fontWeight: FontWeight.w400),
                )
              ],
            ),
          ],
        ),
        IconButton(
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedNotification02, color: Colors.black),
          onPressed: () {
            debugPrint("Notification Pressed");
          },
        )
      ]),
    );
  }
}
