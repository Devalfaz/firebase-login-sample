import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
// Import the firebase_core plugin

import 'package:quac/screens/login/login.dart';
import 'package:quac/screens/onBoard.dart';

void main() {
  runApp(App());
}

bool firstOpen = false;

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen.navigate(
          backgroundColor: Colors.white,
          name: 'assets/flare/splash.flr',
          next: (firstOpen == true)
              ? (context) => Login()
              : (context) => Onboard(),
          until: () => Future.delayed(Duration(seconds: 4)),
          startAnimation: 'Untitled',
        ));
  }
}
