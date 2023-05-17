import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: 80,
          color: SermanosColors.error100,
        ),
        SizedBox(height: 10),
        Text("Algo salió mal, por favor intente de nuevo más tarde.",
            textAlign: TextAlign.center,
            style: SermanosTypography.body02(color: SermanosColors.neutral100)),
      ],
    );
  }
}
