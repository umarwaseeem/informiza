import 'package:flutter/material.dart';


class ThemeProvider with ChangeNotifier{
  bool isSystemTheme = false;
  bool isCustomTheme = false;

  
}


var lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.green[100],
  appBarTheme: AppBarTheme(color: Colors.green[900]),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.green[400],
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
