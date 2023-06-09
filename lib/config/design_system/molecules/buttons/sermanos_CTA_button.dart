import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';
import '../../tokens/sermanos_typography.dart';

class SermanosCTAButton extends StatelessWidget {
  const SermanosCTAButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.filled,
    this.enabled = false,
    this.loading = false,
  }) : super(key: key);

  final bool filled;
  final bool enabled;
  final bool loading;
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
            onPressed: loading ? null : onPressed,
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
                      style: const SermanosTypography.button(
                        color: SermanosColors.neutral0,
                      ),
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
            onPressed: loading ? null : onPressed,
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
                      style: const SermanosTypography.button(
                        color: SermanosColors.primary100,
                      ),
                    ),
            ),
          );
  }
}
