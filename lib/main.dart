import 'package:flutter/material.dart';
import 'package:news_informiza/providers/news.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsItems()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'INFORMIZA ',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.blueGrey[700],
          appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
          drawerTheme: DrawerThemeData(
            backgroundColor: Colors.blueGrey[900],
            elevation: 30,
          ),
        ),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        themeMode: ThemeMode.dark,
        home: const Home(),
        routes: {
          CardItemDetail.routeName: (context) => const CardItemDetail(),
          SettingsScreen.routeName: (context) => const SettingsScreen(),
          PreferencesScreen.routeName: (context) => const PreferencesScreen(),
        },
      ),
    );
  }
}
