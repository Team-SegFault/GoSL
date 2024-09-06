import 'package:GOSL/components/profile_heading.dart';
import 'package:GOSL/components/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Gap(10),
        ProfileHeading(),
        Gap(20),
        ProfileListTile(
          title: "Personal Information",
          icon: HugeIcons.strokeRoundedUserAccount,
        ),
        Gap(10),
        ProfileListTile(
          title: "VISA",
          icon: HugeIcons.strokeRoundedPassport01,
        ),
        Gap(10),
        ProfileListTile(
          title: "FAQ",
          icon: HugeIcons.strokeRoundedMessageQuestion,
        ),
        Gap(10),
        ProfileListTile(
          title: "Notification Settings",
          icon: HugeIcons.strokeRoundedMailSetting02,
        ),
        Gap(10),
        ProfileListTile(
          title: "Language",
          icon: HugeIcons.strokeRoundedLanguageSkill,
        ),
        Gap(10),
        ProfileListTile(
          title: "Logout",
          icon: HugeIcons.strokeRoundedLogout03,
        ),
      ],
    );
  }
}
