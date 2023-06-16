import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';

import '../../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../../../config/providers.dart';
import '../../../domain/models/volunteering.dart';

class PostulateQuitActualVolunteering extends ConsumerWidget {
  const PostulateQuitActualVolunteering({
    Key? key,
    required this.volunteering,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          onPressed: () async {
            await ref.read(firebaseAnalyticsProvider).logEvent(
              name: "redirected_to_postulate_screen_for_cancelation",
              parameters: {
                "voluteering_id": volunteering.id,
              },
            );
            if (context.mounted) {
              context.beamToNamed(PostulateScreen.route);
            }
          },
          textColor: SermanosColors.primary100,
          filled: false,
        ),
      ],
    );
  }
}
