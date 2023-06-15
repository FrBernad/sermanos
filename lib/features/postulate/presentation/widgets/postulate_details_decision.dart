import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/application/controllers/current_user_volunteering_controller.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_quit_postulation.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_quit_volunteering.dart';

import '../../../../config/design_system/cellules/modals/modal.dart';
import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../application/controllers/postulate_user_to_volunteer_controller.dart';
import '../../domain/models/postulation_status.dart';

class PostulateDetailDecision extends ConsumerWidget {
  const PostulateDetailDecision({
    Key? key,
    required this.volunteering,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userVolunteering =
        ref.watch(currentUserVolunteeringControllerProvider);

    if (userVolunteering == null ||
        userVolunteering.status == PostulationStatus.rejected ||
        userVolunteering.status == PostulationStatus.unknown) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SermanosCTAButton(
            text: 'Postularme',
            onPressed: () async {
              final bool? confirmed = await _showConfirmationDialog(
                context,
                volunteering,
              );
              if (confirmed != null && confirmed == true) {
                await ref
                    .read(postulateUserToVolunteerControllerProvider.notifier)
                    .postulate(
                      volunteeringId: volunteering.id,
                    );
              }
            },
            filled: true,
          ),
        ],
      );
    }

    if (userVolunteering.status == PostulationStatus.pending) {
      return const PostulateQuitPostulation();
    }

    return const PostulateQuitVolunteering();
  }

  Future<bool?> _showConfirmationDialog(
      BuildContext context, Volunteering volunteering) async {
    return await showDialog<bool?>(
      barrierDismissible: false,
      // barrierColor: AppColors.neutral0.withOpacity(0.1),
      context: context,
      builder: (BuildContext c) {
        return Modal(
          title: "Te estas por postular a",
          highlightText: volunteering.name,
          cancelButtonText: "Cancelar",
          confirmationButtonText: "Confirmar",
        );
      },
    );
  }
}
