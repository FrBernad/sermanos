import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

class PostulateDetailsMap extends HookConsumerWidget {
  const PostulateDetailsMap({
    Key? key,
    required this.volunteering,
  }) : super(key: key);

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(volunteering.lat, volunteering.lng),
        zoom: 15,
      ),
      markers: <Marker>{
        Marker(
          markerId: MarkerId(volunteering.id),
          onTap: () {},
          position: LatLng(
            volunteering.lat,
            volunteering.lng,
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      },
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
