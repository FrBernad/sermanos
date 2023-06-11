import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/volunteering.dart';
import '../../providers.dart';

class PostulateMap extends HookConsumerWidget {
  const PostulateMap({
    Key? key,
    required this.volunteerings,
  }) : super(key: key);

  final List<Volunteering> volunteerings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVolunteeringIndex =
        ref.watch(currentVolunteeringIndexProvider);

    final mapController = useState<GoogleMapController?>(null);

    if (mapController.value != null) {
      mapController.value!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              double.parse(
                volunteerings[currentVolunteeringIndex].lat,
              ),
              double.parse(
                volunteerings[currentVolunteeringIndex].lng,
              ),
            ),
            zoom: 15,
          ),
        ),
      );
    }

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          //FIXME: Cambiar en volunteerings lat y lng a double
          double.parse(
            volunteerings[currentVolunteeringIndex].lat,
          ),
          double.parse(
            volunteerings[currentVolunteeringIndex].lng,
          ),
        ),
        zoom: 15,
      ),
      markers: volunteeringToMarkers(volunteerings),
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        mapController.value = controller;
      },
    );
  }

  Set<Marker> volunteeringToMarkers(List<Volunteering> volunteerings) {
    Set<Marker> markers = {};

    for (Volunteering volunteering in volunteerings) {
      markers.add(Marker(
        markerId: MarkerId(volunteering.id),
        position: LatLng(
          //FIXME: Cambiar en volunteerings lat y lng a double
          double.parse(volunteering.lat),
          double.parse(volunteering.lng),
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    }

    return markers;
  }
}
