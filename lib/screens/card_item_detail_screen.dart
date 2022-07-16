import 'package:flutter/material.dart';
import 'package:news_informiza/providers/news.dart';
import 'package:provider/provider.dart';

class CardItemDetail extends StatelessWidget {
  static const routeName = "card_item_detail";

  const CardItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedNewsItemDetail =
        Provider.of<NewsItems>(context).findById(newsId);

    var heroImage = Hero(
      tag: newsId,
      child: Image.asset(
        width: double.infinity,
        height: double.infinity,
        loadedNewsItemDetail.path.toString(),
        fit: BoxFit.fill,
      ),
    );

    var appBarTile = Text(
      loadedNewsItemDetail.title.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );

    var newsReadingTime = Text(
      "${loadedNewsItemDetail.time.toString()} mins",
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
    var appBarBottomLine = Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.timelapse_rounded),
            const SizedBox(width: 5),
            newsReadingTime,
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
    var newsDescription = Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        loadedNewsItemDetail.description.toString(),
        style: const TextStyle(fontSize: 20),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 20,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                heroImage,
                FlexibleSpaceBar(
                  title: appBarTile,
                  background: appBarBottomLine,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  height: 1000,
                  child: newsDescription,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  height: 1000,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
