import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/design_system/cellules/modals/volunteering_actions_modal.dart';
import '../../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../application/controllers/postulate_user_to_volunteer_controller.dart';
import '../../../domain/models/volunteering.dart';

class PostulateVolunteering extends ConsumerWidget {
  const PostulateVolunteering({
    Key? key,
    required this.volunteering,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFull = volunteering.isFull();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isFull) ...[
          const Text(
            "No hay vacantes disponibles para postularse",
            style: SermanosTypography.body01(),
          ),
          const SizedBox(height: 24),
        ],
        SermanosCTAButton(
          text: 'Postularme',
          enabled: !isFull,
          filled: true,
          onPressed: () => _showConfirmationDialog(context, volunteering),
        ),
      ],
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
    Volunteering volunteering,
  ) async {
    final confirmed = await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext c) {
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            bool isLoading = false;
            String? errorText;

            ref.watch(postulateUserToVolunteerControllerProvider).maybeWhen(
                  orElse: () {},
                  error: (error, __) => errorText =
                      // FirebaseAuthErrorTranslator.translate(
                      //     context, error.toString()),
                      error.toString(),
                  loading: () => isLoading = true,
                );
            return VolunteeringActionsModal(
              title: "Te estas por postular a",
              isLoading: isLoading,
              onConfirm: () async {
                await ref
                    .read(postulateUserToVolunteerControllerProvider.notifier)
                    .postulate(volunteeringId: volunteering.id);
                if (c.mounted) {
                  Navigator.of(c).pop(true);
                }
              },
              highlightText: volunteering.name,
              cancelButtonText: "Cancelar",
              confirmationButtonText: "Confirmar",
            );
          },
        );
      },
    );
  }
}
