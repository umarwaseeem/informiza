import 'package:flutter/material.dart';

import '../widgets/preference_chip.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  static const routeName = "preferences screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Category Preferences")),
      body: Wrap(
        spacing: 10.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: getChips(),
      ),
    );
  }
}
