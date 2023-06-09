import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';
import 'package:sermanos/features/auth/application/controllers/sign_out_controller.dart';
import 'package:sermanos/features/user/providers.dart';

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
        Column(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(48), // Image radius
                child: CachedNetworkImage(
                  imageUrl:
                      "https://s3-alpha-sig.figma.com/img/113f/a25a/235312cc53dcd4c8780648145d59e3c2?Expires=1682294400&Signature=pWKi-yMiAEKeP4uU0K8lEz6OR8NpewngrMALEcysNY2KDgUIYXmwOhPZwhLaRafEW~OpdXbvEhAwRNbE18eeIrvDF4T0PzyHZNKp2DGa3O999oXDZJLy~YHatOTXWhIHwaNUidgsUJGy4ctS3JEjhyqZ7w-6PhsIiXW3VeVeHy8mKFQg4sSDR63wO2Lj0WRF5jqGz8RK05GBuD4XHj98upcafIj~T7RN78C7uxTlK-G7Li1kUwtX5coR5zcO8Oi6EfAuDh3K6zuM8DaOCPcbOcki3fKB7yB-17aIiyGcBMgA7hCTtepFd9zNYnwQCac2pXfo2uUO29467T1X1dXVBg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
