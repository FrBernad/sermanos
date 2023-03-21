import 'package:flutter/material.dart';

class ColoredTab extends StatelessWidget {
  const ColoredTab({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      child: Tab(text: text),
    );
  }
}
