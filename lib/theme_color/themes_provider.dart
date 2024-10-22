import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:laza_mashro3/theme_color/theme.dart';

class ThemesProvider with ChangeNotifier {
  bool isDarkMode = false;

  ThemesProvider() {
    _loadTheme();
  }

  ThemeData get currentTheme => isDarkMode ? darkMode : lightMode;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    _saveTheme();
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }
}
