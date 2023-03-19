import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColoredTab extends StatelessWidget {
  const ColoredTab({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      child: Tab(child: child),
    );
  }
}
