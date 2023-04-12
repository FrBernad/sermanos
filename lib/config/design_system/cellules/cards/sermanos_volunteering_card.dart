import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_location_icon.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_detail_screen.dart';

import '../../atoms/icons/sermanos_favorite_icon.dart';

class SermanosVolunteeringCard extends StatelessWidget {
  const SermanosVolunteeringCard({
    required this.id,
    required this.imageUrl,
    required this.subtitle,
    required this.overline,
    Key? key,
  }) : super(key: key);

  final String id;
  final String imageUrl;
  final String subtitle;
  final String overline;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.beamToNamed(PostulateDetailScreen.routeFromId(id)),
      child: Container(
        width: 328,
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              height: 138,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overline.toUpperCase(),
                          style: SermanosTypography.overline.copyWith(
                            color: SermanosColors.neutral75,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: SermanosTypography.subtitle01,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      SermanosFavoriteIcon.enabled(),
                      SizedBox(width: 23),
                      SermanosLocationIcon.enabled(),
                    ],
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