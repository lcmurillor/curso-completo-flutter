import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkmode})
      : currentTheme = isDarkmode ? ThemeData.fallback() : ThemeData.light();

  setLigthMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
