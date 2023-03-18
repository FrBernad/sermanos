import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static const route = "/?tab=news";
  static const routeName = "news";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("news"),
    );
  }
}
