import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

class Modal extends StatelessWidget {
  const Modal({
    Key? key,
    required this.title,
    required this.highlightText,
    required this.cancelButtonText,
    required this.confirmationButtonText,
  }) : super(key: key);

  final String title;
  final String? highlightText;
  final String cancelButtonText;
  final String confirmationButtonText;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: 280,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          decoration: BoxDecoration(
            color: SermanosColors.neutral0,
            borderRadius: BorderRadius.circular(4),
            boxShadow: SermanosShadows.shadow3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const SermanosTypography.subtitle01(),
                  ),
                  if (highlightText != null)
                    Text(
                      highlightText!,
                      style: const SermanosTypography.headline02(),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SermanosCTAButton(
                      text: cancelButtonText,
                      onPressed: () => Navigator.of(context).pop(false),
                      textColor: SermanosColors.primary100,
                      filled: false),
                  SermanosCTAButton(
                      text: confirmationButtonText,
                      onPressed: () => Navigator.of(context).pop(true),
                      textColor: SermanosColors.primary100,
                      filled: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
