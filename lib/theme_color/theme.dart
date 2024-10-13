import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        primary: black, secondary: greyLight, tertiary: white),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: black),
      titleTextStyle: TextStyle(color: black),
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        primary: white, secondary: lightDark, tertiary: bgdark),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: white),
      titleTextStyle: TextStyle(color: white),
    ));
