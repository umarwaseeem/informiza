import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news.dart';
import '../screens/card_item_detail_screen.dart';

class CardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String newsId;
  final String description;
  final String time;

  const CardItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.newsId,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsItems>(context, listen: false);

    var cardImage = SizedBox(
      height: double.infinity,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Hero(
            tag: newsId,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

    var titleText = Text(
      title,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );

    var descriptionText = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(description),
    );

    var timeText = Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 25, top: 10),
        alignment: Alignment.center,
        height: 20,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Text(
          "$time minutes",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
    return Dismissible(
      movementDuration: const Duration(seconds: 1),
      dismissThresholds: const {
        DismissDirection.endToStart: 0.5,
      },
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text("Swipe left to delete "),
            SizedBox(width: 10),
            Icon(Icons.delete_sweep_rounded),
          ],
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          newsData.deleteNewsItem(newsId);
        } else if (direction == DismissDirection.startToEnd) {
          return;
        }
      },
      key: Key(newsId),
      child: Column(
        children: [
          timeText,
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CardItemDetail.routeName, arguments: newsId);
            },
            child: SizedBox(
              height: 190,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                color: Colors.black45,
                elevation: 10,
                child: Row(
                  children: [
                    cardImage,
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          titleText,
                          const SizedBox(height: 10),
                          descriptionText,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
