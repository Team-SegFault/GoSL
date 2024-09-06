import 'package:GOSL/components/navbaritem.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
          NavBarItem(pageIndex: 0, icon: Iconsax.home_2, title: 'Home'),
          NavBarItem(pageIndex: 1, icon: Iconsax.send_2, title: 'MyTrip'),
          NavBarItem(pageIndex: 2, icon: Iconsax.heart, title: 'Wishlist'),
          NavBarItem(pageIndex: 3, icon: Iconsax.profile_tick, title: 'Profile'),
        ]),
      ),
    );
  }
}
