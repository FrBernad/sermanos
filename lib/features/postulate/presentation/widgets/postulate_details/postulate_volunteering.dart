import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/presentation/screens/form_modal_screen.dart';
import 'package:sermanos/features/user/providers.dart';

import '../../../../../config/design_system/cellules/modals/sermanos_actions_modal.dart';
import '../../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../../../config/providers.dart';
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
          onPressed: () => _onPressed(context, ref),
        ),
      ],
    );
  }

  Future<void> _onPressed(
    BuildContext context,
    WidgetRef ref,
  ) async {
    AppUser user = ref.read(currentUserProvider)!;
    if (user.isProfileFilled() ||
        await _showCompleteProfileDialog(context, ref)) {
      await ref.read(firebaseAnalyticsProvider).logEvent(
        name: "volunteering_postulation",
        parameters: {
          "voluteering_id": volunteering.id,
        },
      );
      if (context.mounted) {
        _showPostulateConfirmationDialog(context, volunteering);
      }
    }
  }

  Future<bool> _showCompleteProfileDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await ref
        .read(firebaseAnalyticsProvider)
        .logEvent(name: "postulation_try_with_incomplete_profile");

    bool isCompleted = false;
    if (context.mounted) {
      await showDialog<bool?>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext c) {
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              AppUser user = ref.watch(currentUserProvider)!;

              return SermanosActionsModal(
                title: "Para postularte debes primero completar tus datos",
                isLoading: false,
                onConfirm: () async {
                  final isComplete = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileFormModalScreen(
                        user: user,
                      ),
                    ),
                  );
                  if (isComplete != null && isComplete) {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      isCompleted = true;
                    }
                  } else {
                    isCompleted = false;
                  }
                },
                cancelButtonText: "Cancelar",
                confirmationButtonText: "Completar datos",
              );
            },
          );
        },
      );
    }
    return isCompleted;
  }

  void _showPostulateConfirmationDialog(
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
            return SermanosActionsModal(
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
