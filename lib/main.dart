import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:news_informiza/providers/news.dart';
import 'package:news_informiza/providers/theme_provider.dart';
import 'package:news_informiza/screens/home.dart';
import 'package:provider/provider.dart';

import 'screens/card_item_detail_screen.dart';
import 'screens/preferences_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({Key? key, required this.savedThemeMode}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsItems()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, lightTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'INFORMIZA ',
          theme: theme,
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
