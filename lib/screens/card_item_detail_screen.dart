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
        fit: BoxFit.cover,
      ),
    );

    var newsDescription = Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        loadedNewsItemDetail.description.toString(),
        style: const TextStyle(fontSize: 20),
      ),
    );

    var titleAndTime = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          loadedNewsItemDetail.title.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.timelapse,
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(width: 5),
            Text(
              "${loadedNewsItemDetail.time.toString()} mins",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ],
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
                  expandedTitleScale: 1.45,
                  background: Container(
                    color: Colors.black26,
                  ),
                  title: titleAndTime,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  height: 500,
                  color: Colors.amberAccent,
                  child: newsDescription,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  height: 500,
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
