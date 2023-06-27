import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

import '../../../../providers.dart';
import '../../../tokens/sermanos_skeleton.dart';

class SermanosVolunteeringCard extends ConsumerWidget {
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
              CachedNetworkImage(
                imageUrl: volunteering.imageUrl,
                height: 138,
                fit: BoxFit.cover,
                errorWidget: (BuildContext context, String s, dynamic) {
                  return Image.asset(
                    "assets/images/sermanos_image_not_found.png",
                    height: 138,
                  );
                },
                placeholder: (BuildContext context, String url) {
                  return const SermanosSkeleton(rounded: false);
                },
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
      onTap: () async {
        await ref.read(firebaseAnalyticsProvider).logSelectContent(
              contentType: 'Volunteering',
              itemId: volunteering.id,
            );

        if (context.mounted) {
          context.beamToNamed(
            PostulateDetailScreen.routeFromId(volunteering.id),
          );
        }
      },
    );
  }
}
