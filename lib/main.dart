import 'package:cowin_app/screens/HomePage.dart';
import 'package:cowin_app/screens/LandingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: LandingPage.id,
    routes: {
      LandingPage.id: (context) => LandingPage(),
      HomePage.id: (context) => HomePage()
    },
  ));
}
