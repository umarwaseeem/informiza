import 'package:flutter/material.dart';

import '../screens/card_item_detail_screen.dart';

class CardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String newsId;

  const CardItem(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.newsId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          CardItemDetail.routeName,
          arguments: newsId,
        );
      },
      child: SizedBox(
        height: 270,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          elevation: 10,
          color: Colors.grey,
          child: Hero(
            tag: newsId,
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
