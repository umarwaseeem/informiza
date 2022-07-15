import 'package:flutter/material.dart';

import '../widgets/card_item.dart';
import '../widgets/my_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Daily Feed"),
        actions: [
          IconButton(
            // - refresh button
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        
        children: const [
          CardItem(imagePath: "assets/images/logo1.png"),
          CardItem(imagePath: "assets/images/news1.jpg"),
          CardItem(imagePath: "assets/images/news2.jpg"),
        ],
      ),
    );
  }
}
