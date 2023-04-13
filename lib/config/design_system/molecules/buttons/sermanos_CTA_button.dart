import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';
import '../../tokens/sermanos_typography.dart';

class SermanosCTAButton extends StatelessWidget {
  const SermanosCTAButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.filled,
  }) : super(key: key);

  final bool filled;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return filled
        ? FilledButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(SermanosColors.primary100),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: const SermanosTypography.button(
                color: SermanosColors.neutral0,
              ),
            ),
          )
        : TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: const SermanosTypography.button(
                color: SermanosColors.primary100,
              ),
            ),
          );
  }
}
