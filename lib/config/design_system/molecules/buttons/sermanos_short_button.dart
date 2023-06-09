import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

class SermanosShortButton extends StatelessWidget {
  const SermanosShortButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      style: ElevatedButton.styleFrom(
        backgroundColor: SermanosColors.primary100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // <-- Radius
        ),
        padding: const EdgeInsets.all(
          12.0,
        ),
      ),
      label: Text(
        text,
        style: const TextStyle(
          color: SermanosColors.neutral0,
        ),
      ),
    );
  }
}
