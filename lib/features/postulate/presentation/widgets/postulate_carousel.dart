import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/providers.dart';

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
        onPageChanged: (index, _) =>
            ref.read(currentVolunteeringIndexProvider.notifier).set(index),
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
