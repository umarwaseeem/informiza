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

    return Dismissible(
      movementDuration: const Duration(seconds: 1),
      dismissThresholds: const {
        DismissDirection.endToStart: 0.5,
        DismissDirection.startToEnd: 1,
      },
      // direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$time minutes story",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: const [
                Text("Swipe left to delete "),
                SizedBox(width: 10),
                Icon(Icons.delete_sweep_rounded),
              ],
            ),
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
      child: GestureDetector(
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
            margin: const EdgeInsets.all(10),
            color: Colors.grey,
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
    );
  }
}
