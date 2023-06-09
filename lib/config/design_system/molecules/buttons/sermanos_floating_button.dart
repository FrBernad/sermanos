import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

class SermanosFloatingActionButton extends FloatingActionButton {
  const SermanosFloatingActionButton({
    Key? key,
    required Color backgroundColor,
    required Widget? child,
    required Color foregroundColor,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          child: child,
          backgroundColor: onPressed != null
              ? SermanosColors.primary10
              : SermanosColors.neutral10,
          foregroundColor: onPressed != null
              ? SermanosColors.primary100
              : SermanosColors.neutral25,
          onPressed: onPressed,
        );
}
