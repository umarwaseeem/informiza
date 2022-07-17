import 'package:flutter/material.dart';
import 'package:news_informiza/providers/news.dart';
import 'package:provider/provider.dart';

import '../widgets/card_item.dart';
import '../widgets/my_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsItems>(context).items;

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
      body: ListView.builder(
        itemCount: newsData.length,
        itemBuilder: (context, index) {
          return CardItem(
            time: newsData[index].time.toString(),
            description: newsData[index].description.toString(),
            newsId: newsData[index].id.toString(),
            imagePath: newsData[index].path.toString(),
            title: newsData[index].title.toString(),
          );
        },
      ),
    );
  }
}
