import 'package:flutter/material.dart';

class CardItemDetail extends StatelessWidget {
  final String title;
  final String imagePath;

  static const routeName = "card_item_detail";

  const CardItemDetail({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              background: Image.network(imagePath, fit: BoxFit.cover),
            ),
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
