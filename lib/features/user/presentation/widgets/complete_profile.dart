import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/molecules/components/profile_image.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/auth/application/controllers/sign_out_controller.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/presentation/screens/form_modal_screen.dart';
import 'package:sermanos/features/user/presentation/widgets/information_card.dart';

class CompleteProfile extends ConsumerWidget {
  final AppUser user;

  const CompleteProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: SermanosGrid(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 32),
                ProfileImage(imageUrl: user.profileImageUrl),
                const SizedBox(height: 16),
                const Text(
                  "VOLUNTARIO",
                  style: SermanosTypography.overline(
                    color: SermanosColors.neutral75,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  user.getFullName(),
                  style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral100,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  user.emailContact!,
                  style: const SermanosTypography.body01(
                    color: SermanosColors.secondary200,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            InformationCard(
              title: "Información Personal",
              information: [
                (
                  "Fecha de nacimiento",
                  DateFormat('dd/MM/yyyy').format(user.birthdate!)
                ),
                ("Género", user.gender!.text),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            InformationCard(
              title: "Datos de contacto",
              information: [
                ("Teléfono", user.phone!),
                ("E-mail", user.emailContact!),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Column(
                children: [
                  SermanosCTAButton(
                    text: 'Editar perfil',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileFormModalScreen(
                          user: user,
                        ),
                      ),
                    ),
                    filled: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SermanosCTAButton(
                    text: 'Cerrar sesión',
                    onPressed: () async => await ref
                        .watch(signOutControllerProvider.notifier)
                        .signOut(),
                    textColor: SermanosColors.error100,
                    filled: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
