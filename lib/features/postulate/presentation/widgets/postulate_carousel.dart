import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/presentation/widgets/no_volunteering_available.dart';

import '../../../../config/design_system/cellules/cards/sermanos_volunteering_card.dart';
import '../../../../config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import '../../../core/presentation/widgets/error_message.dart';
import '../../application/controllers/get_volunteering_controller.dart';

class PostulateCarousel extends ConsumerWidget {
  const PostulateCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringController = ref.watch(getVolunteeringControllerProvider);

    return volunteeringController.when(
      data: (volunteering) {
        if (volunteering.isEmpty) {
          return const NoVolunteeringAvailable();
        }
        return CarouselSlider.builder(
          options: CarouselOptions(aspectRatio: 16 / 9.4),
          itemCount: volunteering.length,
          itemBuilder: (
            BuildContext context,
            int itemIndex,
            int pageViewIndex,
          ) =>
              Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SermanosVolunteeringCard(
                  volunteering: volunteering[itemIndex],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }
}
