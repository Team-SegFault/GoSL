import 'package:GOSL/components/button.dart';
import 'package:GOSL/components/profile_heading.dart';
import 'package:GOSL/components/profile_list_tile.dart';
import 'package:GOSL/main.dart';
import 'package:GOSL/views/login/login.dart';
import 'package:GOSL/views/visa_application/screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Gap(10),
        const ProfileHeading(),
        const Gap(10),
        const ProfileListTile(
          title: "Personal Information",
          icon: HugeIcons.strokeRoundedUserAccount,
        ),
        ProfileListTile(
          title: "VISA",
          icon: HugeIcons.strokeRoundedPassport01,
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const VisaApplicationPage(),
            ))
          },
        ),
        const ProfileListTile(
          title: "FAQ",
          icon: HugeIcons.strokeRoundedMessageQuestion,
        ),
        const ProfileListTile(
          title: "Notification Settings",
          icon: HugeIcons.strokeRoundedMailSetting02,
        ),
        const ProfileListTile(
          title: "Language",
          icon: HugeIcons.strokeRoundedLanguageSkill,
        ),
        // Use Builder here to get access to the correct context
        ProfileListTile(
          title: "Logout",
          icon: HugeIcons.strokeRoundedLogout03,
          onPressed: () {
            // Show bottom sheet
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              builder: (BuildContext context) {
                return const CustomBottomDrawer();
              },
            );
          },
        ),
        const Gap(10),
      ],
    );
  }
}

class CustomBottomDrawer extends StatelessWidget {
  const CustomBottomDrawer({
    super.key,
  });
  final String accountName = "Perry";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 3, // Adjust the height of the bottom drawer
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Gap(24),
          Text(
            'Logout',
            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 1.3,
            child: Text(
              "Are you sure you want to log out of $accountName's account?",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
                child: AppButton(
                  style: CustomButtonStyles.secondary,
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
                child: AppButton(
                  text: 'Log out',
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ))
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
