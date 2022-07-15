import 'package:flutter/material.dart';

import '../screens/card_item_detail_screen.dart';

class CardItem extends StatelessWidget {
  final String imagePath;

  const CardItem({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CardItemDetail.routeName);
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
          child: Image.asset(imagePath, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
