import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

import '../../molecules/buttons/sermanos_short_button.dart';

class VolunteeringActionsModal extends StatelessWidget {
  const VolunteeringActionsModal({
    Key? key,
    required this.title,
    this.highlightText,
    required this.cancelButtonText,
    required this.confirmationButtonText,
    required this.isLoading,
    required this.onConfirm,
  }) : super(key: key);

  final String title;
  final String? highlightText;
  final bool isLoading;
  final String cancelButtonText;
  final Future<void> Function() onConfirm;
  final String confirmationButtonText;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
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
                  SermanosShortButton(
                    text: cancelButtonText,
                    onPressed: () => Navigator.of(context).pop(false),
                    textColor: SermanosColors.primary100,
                    enabled: !isLoading,
                    filled: false,
                  ),
                  SermanosShortButton(
                    text: confirmationButtonText,
                    onPressed: () async {
                      await onConfirm();
                    },
                    textColor: SermanosColors.primary100,
                    loading: isLoading,
                    filled: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
