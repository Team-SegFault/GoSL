import 'package:GOSL/controllers/navbar_controller.dart';
import 'package:GOSL/views/favourites.dart';
import 'package:GOSL/views/home.dart';
import 'package:GOSL/views/settings.dart';
import 'package:flutter/material.dart';
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
      theme: ThemeData(
        colorScheme: const ColorScheme(
          surface: Color(0xfffafafa),
          onSurface: Colors.black,
          brightness: Brightness.light,
          primary: Colors.orangeAccent,
          onPrimary: Colors.black,
          secondary: Color(0xfffdf6d7),
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
        useMaterial3: false,
      ),
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
        bottomNavigationBar: NavigationBar(
            selectedIndex: navbarController.currentIndex.value,
            onDestinationSelected: (value) => {navbarController.onItemTapped(value)},
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ]),
        body: <Widget>[
          const HomePage(),
          const FavouritesPage(),
          const SettingsPage(),
        ][1]);
  }
}
