import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../features/postulate/application/controllers/add_favorite_volunteering_controller.dart';
import '../../../../../features/postulate/application/controllers/get_favorite_volunteerings_controller.dart';
import '../../../../../features/postulate/application/controllers/remove_favorite_volunteering_controller.dart';
import '../../../../../features/postulate/domain/models/volunteering.dart';
import '../../../../providers.dart';
import '../../../atoms/icons/sermanos_icons.dart';

class VolunteerFavoriteIcon extends ConsumerWidget {
  const VolunteerFavoriteIcon({
    required this.volunteering,
    Key? key,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteVolunteering = ref.watch(
      getFavoriteVolunteeringsControllerProvider.select(
        (favoriteVolunteerings) =>
            favoriteVolunteerings.value != null &&
            favoriteVolunteerings.value!.contains(volunteering.id),
      ),
    );

    final isLoading =
        ref.watch(removeFavoriteVolunteeringControllerProvider).isLoading ||
            ref.watch(addFavoriteVolunteeringControllerProvider).isLoading ||
            ref.watch(getFavoriteVolunteeringsControllerProvider).isLoading;

    return InkWell(
      onTap: isLoading
          ? null
          : () async {
              if (isFavoriteVolunteering) {
                await ref
                    .read(removeFavoriteVolunteeringControllerProvider.notifier)
                    .remove(volunteeringId: volunteering.id);
                await ref.read(firebaseAnalyticsProvider).logEvent(
                  name: "volunteering_remove_favorite",
                  parameters: {
                    "voluteering_id": volunteering.id,
                  },
                );
              } else {
                await ref
                    .read(addFavoriteVolunteeringControllerProvider.notifier)
                    .add(volunteeringId: volunteering.id);
                await ref.read(firebaseAnalyticsProvider).logEvent(
                  name: "volunteering_add_favorite",
                  parameters: {
                    "voluteering_id": volunteering.id,
                  },
                );
              }
            },
      child: isFavoriteVolunteering
          ? SermanosIcons.favoriteFilled(
              status: SermanosIconStatus.activated,
            )
          : SermanosIcons.favoriteOutlined(
              status: SermanosIconStatus.activated,
            ),
    );
  }
}
