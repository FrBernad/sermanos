import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';
import '../../tokens/sermanos_typography.dart';

class SermanosCTAButton extends StatelessWidget {
  const SermanosCTAButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.filled,
    this.textColor = SermanosColors.neutral0,
    this.enabled = true,
    this.loading = false,
  }) : super(key: key);

  final bool filled;
  final bool enabled;
  final bool loading;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return filled
        ? FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: SermanosColors.primary100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
            ),
            onPressed: loading | !enabled ? null : onPressed,
            child: Center(
              child: loading
                  ? const SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: CircularProgressIndicator(
                        color: SermanosColors.neutral0,
                      ),
                    )
                  : Text(
                      text,
                      style: SermanosTypography.button(
                        color: textColor,
                      ),
                    ),
            ),
          )
        : TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
            onPressed: loading | !enabled ? null : onPressed,
            child: Center(
              child: loading
                  ? const SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: CircularProgressIndicator(
                        color: SermanosColors.neutral0,
                      ),
                    )
                  : Text(
                      text,
                      style: SermanosTypography.button(
                        color: textColor,
                      ),
                    ),
            ),
          );
  }
}
