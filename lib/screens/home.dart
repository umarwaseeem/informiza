import 'package:flutter/material.dart';
import 'package:news_informiza/providers/news.dart';
import 'package:provider/provider.dart';

import '../widgets/card_item.dart';
import '../widgets/my_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsItems>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Daily Feed"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: Row(
              children: const [
                Text("Refresh"),
                Icon(Icons.refresh),
              ],
            ),
            // - refresh button
            onPressed: () {},
          ),
        ],
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
