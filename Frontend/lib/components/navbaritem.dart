import 'package:GOSL/controllers/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.pageIndex, required this.icon, this.title = ''});

  final int pageIndex;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavbarController>();
    return Obx(() => pageIndex == controller.currentIndex.value
        ?
        // ActiveState
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFFF7C04A),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
          )
        :
        // InactiveState
        GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => controller.onItemTapped(pageIndex),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Icon(icon),
            ),
          ));
  }
}
