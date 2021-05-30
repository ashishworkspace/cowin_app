import 'package:cowin_app/screens/HomePage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static const String id = "LandingPage";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
