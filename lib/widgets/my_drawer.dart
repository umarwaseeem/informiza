import 'package:flutter/material.dart';
import 'package:news_informiza/screens/settings_screen.dart';
import 'package:news_informiza/widgets/drawer_item.dart';

import '../screens/preferences_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.blueGrey[700],
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            color: Colors.black38,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.network(
                        "https://avatars.githubusercontent.com/u/76011160?v=4",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
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
