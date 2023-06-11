import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';
import '../../tokens/sermanos_shadows.dart';

class SermanosFloatingActionButton extends StatelessWidget {
  const SermanosFloatingActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: SermanosShadows.shadow3,
      ),
      child: Material(
        color: SermanosColors.primary10,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          splashColor: SermanosColors.neutral75.withOpacity(0.1),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: icon,
          ),
        ),
      ),
    );
  }
}
