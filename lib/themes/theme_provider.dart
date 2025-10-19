import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/dark_mode.dart';
import 'package:food_delivery_app/themes/light_mode.dart';

//Helps switch from light mode to dark mode
//ChangeNotifier listens for changes in the ui and apply changes automatically
class ThemeProvider with ChangeNotifier {
  //Holds the current theme data
  ThemeData _themeData = lightMode;
  //getter to access current themedata
  ThemeData get themeData => _themeData;
  //checking if current themedata is dark
  bool get isDarkMode => _themeData == darkMode;

  //update the theme adn notify listeners so the ui can refresh
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //method to toggle between light and dark mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
