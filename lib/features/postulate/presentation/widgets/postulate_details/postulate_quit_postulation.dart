import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/postulate/application/controllers/cancel_user_volunteering_postulation_controller.dart';

import '../../../../../config/design_system/cellules/modals/volunteering_actions_modal.dart';
import '../../../../../config/logger/logger.dart';
import '../../../domain/models/volunteering.dart';

class PostulateQuitPostulation extends StatelessWidget {
  const PostulateQuitPostulation({
    Key? key,
    required this.volunteering,
  }) : super(key: key);

  final Volunteering volunteering;

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
          onPressed: () => _showConfirmationDialog(context, volunteering),
          textColor: SermanosColors.primary100,
          filled: false,
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

            ref
                .watch(cancelUserVolunteeringPostulationControllerProvider)
                .maybeWhen(
                  orElse: () {},
                  error: (error, __) => errorText =
                      // FirebaseAuthErrorTranslator.translate(
                      //     context, error.toString()),
                      error.toString(),
                  loading: () => isLoading = true,
                );

            logger.d(isLoading.toString());
            return ActionsModal(
              title: "¿Estás seguro que querés abandonar tu voluntariado?",
              isLoading: isLoading,
              onConfirm: () async {
                await ref
                    .read(cancelUserVolunteeringPostulationControllerProvider
                        .notifier)
                    .cancel(volunteeringId: volunteering.id);
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
