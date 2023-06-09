import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';
import 'package:sermanos/features/auth/application/controllers/sign_out_controller.dart';
import 'package:sermanos/features/user/providers.dart';
import 'package:sermanos/config/design_system/molecules/components/profile_image.dart';

import '../../../../config/design_system/atoms/icons/sermanos_icons.dart';
import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../user/domain/models/app_user_model.dart';

class ProfileScreen extends ConsumerWidget {
  static const route = "/profile";
  static const routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppUser? user = ref.watch(currentUserProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          children: [
            ProfileImage(),
            //FIXME: No estoy seguro si el espacio es con un SizedBox o de otra forma
            SizedBox(height: 8),
            SizedBox(
              width: 328,
              child: Column(
                children: [
                  Text(
                    "VOLUNTARIO",
                    style: SermanosTypography.overline(
                      color: SermanosColors.neutral75,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user?.name ?? "",
                    style: const SermanosTypography.subtitle01(
                      color: SermanosColors.neutral100,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                    textAlign: TextAlign.center,
                    style: SermanosTypography.body01(
                      color: SermanosColors.neutral75,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SermanosShortButton(
          icon: SermanosIcons.add(status: SermanosIconStatus.enabled),
          text: "Completar",
          onPressed: () => {},
        ),
        SermanosShortButton(
          icon: SermanosIcons.add(status: SermanosIconStatus.enabled),
          text: "Cerrar Sesion",
          onPressed: () async =>
              await ref.watch(signOutControllerProvider.notifier).signOut(),
        ),
      ],
    );
  }
}
