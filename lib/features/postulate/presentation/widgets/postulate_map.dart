import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/features/postulate/application/controllers/focused_coordinate_controller.dart';
import 'package:sermanos/features/postulate/application/controllers/user_position_controller.dart';
import 'package:sermanos/features/postulate/application/controllers/volunteering_search_controller.dart';

import '../../../core/presentation/widgets/error_message.dart';
import '../../domain/models/volunteering.dart';

class PostulateMap extends HookConsumerWidget {
  const PostulateMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedCoordinate = ref.watch(focusedCoordinateControllerProvider);

    final volunteerings =
        ref.watch(volunteeringSearchControllerProvider).value!;

    final mapController = useState<GoogleMapController?>(null);

    if (mapController.value != null) {
      mapController.value!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: focusedCoordinate.value!,
            zoom: 15,
          ),
        ),
      );
    }

    return focusedCoordinate.when(
      skipLoadingOnReload: true,
      data: (coordinates) => GoogleMap(
        initialCameraPosition: CameraPosition(
          target: coordinates,
          zoom: 15,
        ),
        markers: _volunteeringToMarkers(volunteerings),
        circles: _userCoordinatesCircle(
          ref.read(userPositionControllerProvider).value!,
        ),
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController.value = controller;
        },
      ),
      error: (_, __) => const Align(
        alignment: Alignment.center,
        child: ErrorMessage(),
      ),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }

  Set<Marker> _volunteeringToMarkers(
    List<Volunteering> volunteerings,
  ) {
    Set<Marker> markers = {};

    for (Volunteering volunteering in volunteerings) {
      markers.add(
        Marker(
          markerId: MarkerId(volunteering.id),
          onTap: () {},
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

  Set<Circle> _userCoordinatesCircle(
    LatLng userCoordinates,
  ) {
    return {
      Circle(
        circleId: const CircleId("user_coordinates1"),
        radius: 40,
        strokeWidth: 1,
        zIndex: 10,
        fillColor: SermanosColors.neutral0,
        strokeColor: SermanosColors.secondary200,
        center: userCoordinates,
      ),
      Circle(
        circleId: const CircleId("user_coordinates2"),
        radius: 30,
        strokeWidth: 1,
        zIndex: 50,
        fillColor: SermanosColors.secondary200,
        strokeColor: SermanosColors.secondary200,
        center: userCoordinates,
      ),
    };
  }
}
