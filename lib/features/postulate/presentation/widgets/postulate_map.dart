import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/features/postulate/application/controllers/current_volunteering_lat_lng_controller.dart';
import 'package:sermanos/features/postulate/application/controllers/user_position_controller.dart';

import '../../domain/models/volunteering.dart';

class PostulateMap extends HookConsumerWidget {
  const PostulateMap({
    Key? key,
    required this.volunteerings,
  }) : super(key: key);

  final List<Volunteering> volunteerings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVolunteeringLatLang =
        ref.watch(currentVolunteeringLatLngControllerProvider);

    final mapController = useState<GoogleMapController?>(null);

    final userCoordinates = ref.watch(userPositionControllerProvider).value;

    if (mapController.value != null) {
      if (volunteerings.isNotEmpty) {
        mapController.value!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentVolunteeringLatLang,
              zoom: 15,
            ),
          ),
        );
      } else {
        mapController.value!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: userCoordinates!,
              zoom: 15,
            ),
          ),
        );
      }
    }

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: volunteerings.isNotEmpty
            ? currentVolunteeringLatLang
            : userCoordinates!,
        zoom: 15,
      ),
      markers: _volunteeringToMarkers(volunteerings),
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        mapController.value = controller;
      },
    );
  }

  Set<Marker> _volunteeringToMarkers(List<Volunteering> volunteerings) {
    Set<Marker> markers = {};

    for (Volunteering volunteering in volunteerings) {
      markers.add(
        Marker(
          markerId: MarkerId(volunteering.id),
          position: LatLng(
            volunteering.lat,
            volunteering.lng,
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    return markers;
  }
}
