import 'dart:async';
import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/nav_bar_screen.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => BottomNavBar()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgscreen1,
      body: Center(
        child: Text('laza'),
      ),
    );
  }
}
