import 'package:flutter/material.dart';
import 'package:news_informiza/providers/news.dart';
import 'package:news_informiza/providers/theme_provider.dart';
import 'package:news_informiza/screens/home.dart';
import 'package:provider/provider.dart';

import 'screens/card_item_detail_screen.dart';
import 'screens/preferences_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsItems()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeData, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'INFORMIZA ',
          theme: themeData.theme ? lightTheme : darkTheme,
          home: const Home(),
          routes: {
            CardItemDetail.routeName: (context) => const CardItemDetail(),
            SettingsScreen.routeName: (context) => const SettingsScreen(),
            PreferencesScreen.routeName: (context) => const PreferencesScreen(),
          },
        ),
      ),
    );
  }
}
