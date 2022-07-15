import 'package:flutter/material.dart';
import 'package:news_informiza/screens/home.dart';

import 'screens/card_item_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INFORMIZA ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
      routes: {
        CardItemDetail.routeName: (context) => const CardItemDetail(
            imagePath: "assets/images/logo1.png", title: "haha"),
      },
    );
  }
}
