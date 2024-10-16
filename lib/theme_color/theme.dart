import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

ThemeData lightMode = ThemeData(
    primaryColor: mainColor,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: black,
      secondary: greyLight,
      tertiary: white,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: black),
      titleTextStyle: TextStyle(color: black),
    ));

ThemeData darkMode = ThemeData(
     primaryColor: bgdark,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        primary: white, secondary: lightDark, tertiary: bgdark),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: white),
      titleTextStyle: TextStyle(color: white),
    ));
