import 'package:flutter/material.dart';
import 'package:GOSL/components/navbar.dart';
import 'package:GOSL/controllers/navbar_controller.dart';
import 'package:GOSL/views/mytrip.dart';
import 'package:GOSL/views/home.dart';
import 'package:GOSL/views/profileview.dart';
import 'package:GOSL/views/wishlistview.dart';
import 'package:GOSL/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoSL',
      theme: theme,
      home: MainPage(),
    );
  }
}


class MainPage extends StatelessWidget {
  MainPage({super.key});
  final navbarController = Get.put(NavbarController());


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        bottomNavigationBar: const CustomNavBar(),
        body: Obx(() => <Widget>[
              const HomePage(),
              const MyTripPage(),
              const WishListPage(),
              const ProfilePage(),
            ][navbarController.currentIndex.value]));
  }
}
