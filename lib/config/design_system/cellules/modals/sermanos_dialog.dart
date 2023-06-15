import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

class SermanosDialog extends AlertDialog {
  SermanosDialog({
    Key? key,
    required String title,
    required String content,
    List<Widget>? actions,
  }) : super(
          key: key,
          backgroundColor: SermanosColors.neutral0,
          title: Text(
            title,
            style: const SermanosTypography.headline02(
              color: SermanosColors.neutral100,
            ),
          ),
          content: Text(
            content,
            style: const SermanosTypography.body01(
              color: SermanosColors.neutral100,
            ),
          ),
          actions: actions,
          actionsAlignment: MainAxisAlignment.end,
        );
}
