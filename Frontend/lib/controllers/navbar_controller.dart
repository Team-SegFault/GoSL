import 'package:get/get.dart';

class NavbarController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}