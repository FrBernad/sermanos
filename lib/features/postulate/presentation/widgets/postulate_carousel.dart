import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sermanos/features/postulate/application/controllers/current_volunteering_lat_lng_controller.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

import '../../../../config/design_system/cellules/cards/sermanos_volunteering_card.dart';

class PostulateCarousel extends ConsumerWidget {
  const PostulateCarousel({
    Key? key,
    required this.volunteerings,
  }) : super(key: key);

  final List<Volunteering> volunteerings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 250,
        enableInfiniteScroll: false,
        initialPage: 0,
        onPageChanged: (index, _) => ref
            .read(currentVolunteeringLatLngControllerProvider.notifier)
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
