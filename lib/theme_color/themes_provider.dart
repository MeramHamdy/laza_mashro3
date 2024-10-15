import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:laza_mashro3/theme_color/theme.dart';

class ThemesProvider with ChangeNotifier {
  bool isDarkMode = false; // Default to light mode

  ThemesProvider() {
    _loadTheme(); // Load the saved theme when the provider is created
  }

  ThemeData get currentTheme => isDarkMode ? darkMode : lightMode;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    _saveTheme(); // Save the current theme preference
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false; // Load saved theme or default to light
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode); // Save the current theme
  }
}
