import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool theme = false;


  void toggleTheme(bool value) {
    theme = !theme;
    notifyListeners();
  }

  bool getTheme() {
    return theme;
  }


}
