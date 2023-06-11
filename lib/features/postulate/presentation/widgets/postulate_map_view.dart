import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_carousel.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_map.dart';

import '../../../../config/design_system/atoms/icons/sermanos_icons.dart';
import '../../../../config/design_system/molecules/buttons/sermanos_floating_button.dart';
import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../../../../config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../core/presentation/widgets/error_message.dart';
import '../../application/controllers/get_volunteering_controller.dart';
import 'no_volunteering_available.dart';

class PostulateMapView extends ConsumerWidget {
  const PostulateMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringController = ref.watch(getVolunteeringControllerProvider);

    return volunteeringController.when(
      data: (volunteerings) {
        if (volunteerings.isEmpty) {
          return const NoVolunteeringAvailable();
        }
        return Stack(
          children: [
            Positioned.fill(
              child: PostulateMap(
                volunteerings: volunteerings,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      SizedBox(height: 24),
                      SermanosGrid(child: SermanosSearchBar()),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SermanosGrid(
                          child: SermanosFloatingActionButton(
                            icon: SermanosIcons.nearMeFilled(
                              status: SermanosIconStatus.activated,
                            ),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PostulateCarousel(volunteerings: volunteerings),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }
}
