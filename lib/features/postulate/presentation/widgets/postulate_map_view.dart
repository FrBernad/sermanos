import 'package:flutter/material.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_carousel.dart';

import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';

class PostulateMapView extends StatelessWidget {
  const PostulateMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          //FIXME: remove image from assets
          child: Image.asset(
            'assets/images/map.png',
            fit: BoxFit.cover,
          ),
        ),
        const Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 24),
                  SermanosGrid(child: SermanosSearchBar()),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PostulateCarousel(),
                  SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
