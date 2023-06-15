import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/cellules/cards/volunteering_card/volunteer_favorite_icon.dart';
import 'package:sermanos/config/design_system/molecules/components/vacancies.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/core/utils/maps_utils.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_detail_screen.dart';

class SermanosVolunteeringCard extends HookConsumerWidget {
  const SermanosVolunteeringCard({
    required this.volunteering,
    Key? key,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow2,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: NetworkImage(volunteering.imageUrl),
                fit: BoxFit.cover,
                height: 138,
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
                        VolunteerFavoriteIcon(volunteering: volunteering),
                        const SizedBox(width: 23),
                        InkWell(
                          onTap: () => openLocationOnGoogleMaps(
                            volunteering.lat,
                            volunteering.lng,
                          ),
                          child: SermanosIcons.locationFilled(
                            status: SermanosIconStatus.activated,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => context.beamToNamed(
        PostulateDetailScreen.routeFromId(volunteering.id),
      ),
    );
  }
}
