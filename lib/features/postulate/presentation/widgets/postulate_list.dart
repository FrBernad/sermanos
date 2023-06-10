import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

import '../../../../config/design_system/cellules/cards/sermanos_volunteering_card.dart';
import '../../../../config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../core/presentation/widgets/error_message.dart';
import '../../application/controllers/get_social_actions_controller.dart';

class PostulateList extends ConsumerWidget {
  const PostulateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialActionsController =
        ref.watch(getSocialActionsControllerProvider);

    return socialActionsController.when(
      data: (socialActions) {
        if (socialActions.isEmpty) {
          return SermanosGrid(
            child: Container(
              height: 108,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: SermanosColors.neutral0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 24,
              ),
              child: const Center(
                child: Text(
                  "Actualmente no hay voluntariados vigentes. Pronto se irán ircorporando nuevos",
                  textAlign: TextAlign.center,
                  style: SermanosTypography.subtitle01(
                    color: SermanosColors.neutral100,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                SermanosGrid.horizontalSpacing,
                0,
                SermanosGrid.horizontalSpacing,
                32,
              ),
              itemCount: socialActions.length,
              itemBuilder: (context, index) => SermanosVolunteeringCard(
                socialAction: socialActions[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 24,
              ),
            ),
          );
        }
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }
}
