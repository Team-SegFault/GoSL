import 'package:GOSL/components/button.dart';
import 'package:GOSL/components/profile_heading.dart';
import 'package:GOSL/components/profile_list_tile.dart';
import 'package:GOSL/views/login/login.dart';
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
        const Gap(20),
        const ProfileListTile(
          title: "Personal Information",
          icon: HugeIcons.strokeRoundedUserAccount,
        ),
        const Gap(10),
        const ProfileListTile(
          title: "VISA",
          icon: HugeIcons.strokeRoundedPassport01,
        ),
        const Gap(10),
        const ProfileListTile(
          title: "FAQ",
          icon: HugeIcons.strokeRoundedMessageQuestion,
        ),
        const Gap(10),
        const ProfileListTile(
          title: "Notification Settings",
          icon: HugeIcons.strokeRoundedMailSetting02,
        ),
        const Gap(10),
        const ProfileListTile(
          title: "Language",
          icon: HugeIcons.strokeRoundedLanguageSkill,
        ),
        const Gap(10),
        // Use Builder here to get access to the correct context
        Builder(
          builder: (BuildContext context) {
            return ProfileListTile(
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
                    return Container(
                      height: 200, // Adjust the height of the bottom drawer
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            'Confirm Logout',
                            style: TextStyle(
                                color:Theme.of(context).colorScheme.secondary
                            ),
                          ),
                          const Gap(10),
                          const Text('Are you sure you want to log out?'
                          ,style: TextStyle(
                              fontSize: 16,
                            ),),
                          const Gap(40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                child:AppButton(text: 'Cancel',onPressed: (){
                                  Navigator.of(context).maybePop();
                                },),),
                              Gap(40),
                              SizedBox(
                                width: 100,
                                child:AppButton(text: 'Log out',onPressed: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ))
                                },),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        )

      ],
    );
  }
}
