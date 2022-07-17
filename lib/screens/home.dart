import 'package:flutter/material.dart';
import 'package:news_informiza/providers/news.dart';
import 'package:provider/provider.dart';

import '../widgets/card_item.dart';
import '../widgets/my_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool themeMode = false;

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsItems>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Daily Feed"),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: newsData.items.length,
        itemBuilder: (context, index) {
          return CardItem(
            time: newsData.items[index].time.toString(),
            description: newsData.items[index].description.toString(),
            newsId: newsData.items[index].id.toString(),
            imagePath: newsData.items[index].path.toString(),
            title: newsData.items[index].title.toString(),
          );
        },
      ),
    );
  }
}
