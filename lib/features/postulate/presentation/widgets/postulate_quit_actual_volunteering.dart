import 'package:flutter/cupertino.dart';

import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

class PostulateQuitActualVolunteering extends StatelessWidget {
  const PostulateQuitActualVolunteering({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.",
          style: SermanosTypography.body01(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SermanosCTAButton(
          text: "Abandonar voluntariado actual",
          onPressed: () {},
          textColor: SermanosColors.primary100,
          filled: false,
        ),
      ],
    );
  }
}
