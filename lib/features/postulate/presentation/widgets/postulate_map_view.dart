import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_carousel.dart';

import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';

class PostulateMapView extends StatelessWidget {
  const PostulateMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    return Stack(
      children: [
        Positioned.fill(
          //FIXME: remove image from assets
          child: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
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
