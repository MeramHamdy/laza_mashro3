import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/theme.dart';

class ThemesProvider with ChangeNotifier {
  bool isDarkMode = false;

  ThemeData get currentTheme => isDarkMode ? darkMode : lightMode;

  void toggleThem() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
