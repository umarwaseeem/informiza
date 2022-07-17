import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "settings screen";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool set1 = false;
  bool set2 = false;
  bool set3 = false;
  bool set4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: const [Text("Done"), Icon(Icons.done_rounded)],
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            settingTile("Setting 1", "Turned On", "Turned Off", set1, (value) {
              setState(() {
                set1 = value;
              });
            }),
            settingTile("Setting 2", "Turned On", "Turned Off", set2, (value) {
              setState(() {
                set2 = value;
              });
            }),
            settingTile("Setting 3", "Turned On", "Turned Off", set3, (value) {
              setState(() {
                set3 = value;
              });
            }),
            settingTile("Setting 4", "Turned On", "Turned Off", set4, (value) {
              setState(() {
                set4 = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  ListTile settingTile(String title, String sub1, String sub2, bool isSwitch,
      void Function(bool) change) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: Text(title),
      subtitle: isSwitch ? Text(sub1) : Text(sub2),
      trailing: Switch(
        activeColor: Colors.green,
        inactiveTrackColor: Colors.red[300],
        inactiveThumbColor: Colors.red[700],
        value: isSwitch,
        onChanged: change,
      ),
    );
  }
}
