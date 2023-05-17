import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

class SermanosCircularProgressIndicator extends StatelessWidget {
  const SermanosCircularProgressIndicator({
    super.key,
    this.width = 60,
    this.height = 60,
    this.color = SermanosColors.primary100,
  });

  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
