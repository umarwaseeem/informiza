import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String destination;

  const DrawerItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        onTap: () {
          if (destination != "-") {
            Navigator.of(context).pushNamed(destination);
          } else {
            Navigator.of(context).pop();
          }
        },
        title: Text(title),
        leading: Icon(icon),
      ),
    );
  }
}
