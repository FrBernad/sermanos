import 'package:flutter/cupertino.dart';

import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

class PostulateQuitPostulation extends StatelessWidget {
  const PostulateQuitPostulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Te has postulado",
          style: SermanosTypography.headline02(
            color: SermanosColors.neutral100,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
          style: SermanosTypography.body01(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SermanosCTAButton(
          text: 'Retirar postulación',
          onPressed: () {},
          textColor: SermanosColors.primary100,
          filled: false,
        ),
      ],
    );
  }
}
