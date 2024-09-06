import 'package:GOSL/components/navbaritem.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -1),
            blurRadius: 8,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 31),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          NavBarItem(pageIndex: 0, icon: HugeIcons.strokeRoundedHome01, title: 'Home'),
          NavBarItem(pageIndex: 1, icon: HugeIcons.strokeRoundedSent, title: 'MyTrip'),
          NavBarItem(pageIndex: 2, icon: HugeIcons.strokeRoundedFavourite, title: 'Wishlist'),
          NavBarItem(pageIndex: 3, icon: HugeIcons.strokeRoundedUser, title: 'Profile'),
        ]),
      ),
    );
  }
}
