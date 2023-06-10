import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/molecules/components/vacancies.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_detail_screen.dart';

class SermanosVolunteeringCard extends StatelessWidget {
  const SermanosVolunteeringCard({
    required this.volunteering,
    Key? key,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: NetworkImage(volunteering.imageUrl),
              fit: BoxFit.cover,
              height: 138,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          volunteering.category.toUpperCase(),
                          style: const SermanosTypography.overline(
                            color: SermanosColors.neutral75,
                          ),
                        ),
                        Text(
                          volunteering.name,
                          style: const SermanosTypography.subtitle01(),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Vacancies(
                          vacancy: volunteering.capacity -
                              volunteering.volunteersQty,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SermanosIcons.favoriteOutlined(
                        status: SermanosIconStatus.activated,
                      ),
                      const SizedBox(width: 23),
                      SermanosIcons.locationFilled(
                        status: SermanosIconStatus.activated,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => context.beamToNamed(
        PostulateDetailScreen.routeFromId(volunteering.id),
      ),
    );
  }
}
