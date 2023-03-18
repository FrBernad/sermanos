import 'package:flutter/material.dart';

class PostulateScreen extends StatelessWidget {
  static const route = "/?tab=postulate";
  static const routeName = "postulate";

  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("postulate"),
    );
  }
}
