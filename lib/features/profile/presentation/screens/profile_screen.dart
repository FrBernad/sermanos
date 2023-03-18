import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const route = "/?tab=profile";
  static const routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("profile"),
    );
  }
}
