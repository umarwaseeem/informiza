import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "settings screen";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Container(),
    );
  }
}
