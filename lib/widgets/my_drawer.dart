import 'package:flutter/material.dart';
import 'package:news_informiza/screens/settings_screen.dart';
import 'package:news_informiza/widgets/drawer_item.dart';

import '../screens/preferences_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[700],
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.black38,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const DrawerItem(
            icon: Icons.home,
            title: "Home - Your Feed",
            destination: "-",
          ),
          const Divider(),
          const DrawerItem(
            icon: Icons.abc,
            title: "Set Preferences",
            destination: PreferencesScreen.routeName,
          ),
          const Divider(),
          Expanded(child: Container()),
          const DrawerItem(
            title: "Settings",
            icon: Icons.settings,
            destination: SettingsScreen.routeName,
          ),
        ],
      ),
    );
  }
}
