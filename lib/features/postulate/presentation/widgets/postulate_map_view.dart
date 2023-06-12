import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_carousel.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_map.dart';
import 'package:sermanos/features/postulate/presentation/widgets/user_position_button.dart';

import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../../../../config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../core/presentation/widgets/error_message.dart';
import '../../application/controllers/volunteering_search_controller.dart';
import 'no_volunteering_available.dart';

class PostulateMapView extends HookConsumerWidget {
  const PostulateMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringController =
        ref.watch(volunteeringSearchControllerProvider);

    return volunteeringController.when(
      data: (volunteerings) {
        return Stack(
          children: [
            Positioned.fill(
              child: PostulateMap(volunteerings: volunteerings),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 24),
                      SermanosGrid(
                        child: SermanosSearchBar(
                          onChanged: (value) {
                            ref
                                .read(volunteeringSearchControllerProvider
                                    .notifier)
                                .search(searchTerm: value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: UserPositionButton(),
                      ),
                      const SizedBox(height: 16),
                      volunteerings.isEmpty
                          ? const NoVolunteeringAvailable()
                          : PostulateCarousel(volunteerings: volunteerings),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) =>
          const Align(alignment: Alignment.center, child: ErrorMessage()),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }
}
