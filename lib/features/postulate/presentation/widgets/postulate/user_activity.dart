import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/features/postulate/application/controllers/get_user_volunteering_controller.dart';

import '../../../../../config/design_system/atoms/icons/sermanos_icons.dart';
import '../../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../../core/presentation/widgets/error_message.dart';
import '../../../../core/utils/maps_utils.dart';
import '../../../application/controllers/current_user_volunteering_controller.dart';
import '../../screens/postulate_detail_screen.dart';

class UserActivity extends ConsumerWidget {
  const UserActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userVolunteeringAsync =
        ref.watch(getUserVolunteeringControllerProvider);
    return SliverToBoxAdapter(
      child: userVolunteeringAsync.when(
        data: (_) {
          final userVolunteering = ref.watch(
            currentUserVolunteeringControllerProvider,
          );
          if (userVolunteering == null) {
            return const SizedBox.shrink();
          }
          return SermanosGrid(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Tu actividad",
                  style: SermanosTypography.headline01(),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => context.beamToNamed(
                    PostulateDetailScreen.routeFromId(userVolunteering.id),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: SermanosColors.primary5,
                      border: Border.all(
                        color: SermanosColors.primary100,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: SermanosShadows.shadow2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userVolunteering.category.toUpperCase(),
                              style: const SermanosTypography.overline(
                                color: SermanosColors.neutral75,
                              ),
                            ),
                            Text(
                              userVolunteering.name,
                              style: const SermanosTypography.subtitle01(),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => openLocationOnGoogleMaps(
                            userVolunteering.lat,
                            userVolunteering.lng,
                          ),
                          child: SermanosIcons.locationFilled(
                            status: SermanosIconStatus.activated,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
        error: (error, stackTrace) =>
            const Align(alignment: Alignment.topCenter, child: ErrorMessage()),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }
}
