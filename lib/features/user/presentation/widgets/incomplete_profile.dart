import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';
import 'package:sermanos/config/design_system/molecules/components/profile_image.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/auth/application/controllers/sign_out_controller.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/presentation/screens/form_modal_screen.dart';

class IncompleteProfile extends ConsumerWidget {
  final AppUser user;

  const IncompleteProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            ProfileImage(imageUrl: user.profileImageUrl),
            //FIXME: No estoy seguro si el espacio es con un SizedBox o de otra forma
            const SizedBox(height: 8),
            SizedBox(
              width: 328,
              child: Column(
                children: [
                  const Text(
                    "VOLUNTARIO",
                    style: SermanosTypography.overline(
                      color: SermanosColors.neutral75,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.getFullName(),
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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileFormModalScreen(
                  user: user,
                ),
              ),
            ),

        ),

      ],
    );
  }
}
