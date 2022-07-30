import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "settings screen";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    void setCustomTheme(bool customTheme) {
      if (customTheme == true) {
        AdaptiveTheme.of(context).setDark();
      } else {
        AdaptiveTheme.of(context).setLight();
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                // save the filters
                Navigator.of(context).pop();
              },
              child: Row(
                children: const [
                  Text("Save"),
                  SizedBox(width: 10),
                  Icon(Icons.save_as_sharp)
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            settingTile(
                "System Theme",
                "Custom Theme",
                "Choose either system theme or your custom theme",
                themeProvider.isSystemTheme,
                true, (value) {
              setState(() {
                themeProvider.isSystemTheme = value;
                if (themeProvider.isSystemTheme) {
                  // isCustomTheme = false;
                  AdaptiveTheme.of(context).setSystem();
                } else if (!themeProvider.isSystemTheme) {
                  setCustomTheme(themeProvider.isCustomTheme);
                }
              });
            }),
            settingTile(
                "Dark Theme",
                "Light Theme",
                "Choose light or dark theme",
                themeProvider.isCustomTheme,
                !themeProvider.isSystemTheme, (value) {
              setState(() {
                themeProvider.isCustomTheme = value;
                setCustomTheme(themeProvider.isCustomTheme);
              });
            }),
          ],
        ),
      ),
    );
  }

  Container settingTile(
    String title1,
    String title2,
    String sub,
    bool isSwitch,
    bool enableSwitch,
    void Function(bool) change,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: isSwitch ? Text(title1) : Text(title2),
        subtitle: Text(sub),
        trailing: CupertinoSwitch(
          activeColor: Colors.green,
          value: isSwitch,
          onChanged: enableSwitch ? change : null,
        ),
      ),
    );
  }
}
