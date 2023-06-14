import 'package:flutter/cupertino.dart';

import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

class PostulateQuitVolunteering extends StatelessWidget {
  const PostulateQuitVolunteering({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Estás participando",
          style: SermanosTypography.headline02(
            color: SermanosColors.neutral100,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "La organización confirmó que ya estas participando de este voluntariado",
          style: SermanosTypography.body01(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SermanosCTAButton(
          text: 'Abandonar voluntariado',
          onPressed: () {},
          textColor: SermanosColors.primary100,
          filled: false,
        ),
      ],
    );
  }
}
