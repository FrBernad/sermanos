import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sermanos/features/postulate/application/controllers/focused_coordinate_controller.dart';

import '../../../../config/design_system/cellules/cards/sermanos_volunteering_card.dart';
import '../../application/controllers/volunteering_search_controller.dart';

class PostulateCarousel extends ConsumerWidget {
  const PostulateCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteerings =
        ref.watch(volunteeringSearchControllerProvider).value!;

    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 250,
        enableInfiniteScroll: false,
        initialPage: 0,
        onPageChanged: (index, _) => ref
            .read(focusedCoordinateControllerProvider.notifier)
            .set(LatLng(volunteerings[index].lat, volunteerings[index].lng)),
      ),
      itemCount: volunteerings.length,
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
              volunteering: volunteerings[itemIndex],
            ),
          ),
        ),
      ),
    );
  }
}
