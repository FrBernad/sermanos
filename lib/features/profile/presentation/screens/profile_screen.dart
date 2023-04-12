import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/design_system/tokens/ds_colors.dart';
import '../../../../config/design_system/tokens/ds_typography.dart';

class ProfileScreen extends StatelessWidget {
  static const route = "/?tab=profile";
  static const routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      "https://s3-alpha-sig.figma.com/img/113f/a25a/235312cc53dcd4c8780648145d59e3c2?Expires=1680480000&Signature=Vk56T0L8GpTjfwOxZhYvCS3uCSow958NYuvKqoXrke-b5SwAMwtRB3fPfN4dMwbCVeHBvbGrdL053DuPqHnistbH1APR~jK-It9KnuBp3lqPkxPKucOZHTXTO1dwICQWCf10S6wC6AG5eO62GIrA~5NwSFCSsql4maPHM8JCBQw~~RqnWKqUVkoKbKmTWe89F-WYlvcewlkIZwlfF7kn3TcUj93oP8fl~eUXjWsYe53kXPlTi1hYyycTN1cG~6avdi6ozbDvCe4B1qDQFLPKUo3XqZUIEVmY4iy3qNV8DK1SSsX2DvKWjHOKALnj4Seqx6GKgp2A8ZRgyvqjBIxkdw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //FIXME: No estoy seguro si el espacio es con un SizedBox o de otra forma
            const SizedBox(height: 8),
            Container(
              width: 328,
              child: Column(
                children: [
                  Text(
                    "VOLUNTARIO",
                    style: DesignSystemTypography.overline.copyWith(
                      color: DesignSystemColors.neutral75,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Juan Cruz",
                    style: DesignSystemTypography.subtitle01.copyWith(
                      color: DesignSystemColors.neutral100,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                    textAlign: TextAlign.center,
                    style: DesignSystemTypography.body01.copyWith(
                      color: DesignSystemColors.neutral75,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: DesignSystemColors.neutral0,
            size: 24,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignSystemColors.primary100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // <-- Radius
            ),
            padding: const EdgeInsets.all(
              14.0,
            ),
          ),
          label: const Text(
            "Completar",
            style: TextStyle(
              color: DesignSystemColors.neutral0,
            ),
          ),
        ),
      ],
    );
  }
}
