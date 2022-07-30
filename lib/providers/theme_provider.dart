import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isSystemTheme = false;
  bool isCustomTheme = false;

  void saveToSharedPreferences() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("isSystemTheme", isSystemTheme);
      prefs.setBool("isCustomTheme", isCustomTheme);
    });
  }

  void loadFromSharedPreferences() {
    SharedPreferences.getInstance().then((prefs) {
      isSystemTheme = prefs.getBool("isSystemTheme") ?? false;
      isCustomTheme = prefs.getBool("isCustomTheme") ?? false;
      notifyListeners();
    });
  }

  void setIsCustom(bool value) {
    isCustomTheme = value;
    saveToSharedPreferences();
    notifyListeners();
  }

  void setIsSystem(bool value) {
    isSystemTheme = value;
    saveToSharedPreferences();
    notifyListeners();
  }
}

var lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.green[100],
  appBarTheme: AppBarTheme(color: Colors.green[900]),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.green[200],
    elevation: 30,
  ),
);
var darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.blueGrey[700],
  appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.blueGrey[900],
    elevation: 30,
  ),
);
