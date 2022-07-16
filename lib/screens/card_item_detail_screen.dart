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

    var text = Text(
      loadedNewsItemDetail.title.toString(),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: text,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: heroImage,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 2000),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
