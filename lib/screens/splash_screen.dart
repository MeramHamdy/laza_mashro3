import 'dart:async';
import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/log_in_screen.dart';
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
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => LoginPage()))));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Image.asset('assets/Logo.png',color: white,),
            ),
        );
    }
}