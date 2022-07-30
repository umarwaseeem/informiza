import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  static const routeName = "preferences screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Category Preferences")),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: GridView.builder(
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 45,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 21,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.black45,
                      ),
                      child: Center(child: Text("$index")),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
