import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/application/controllers/user_position_controller.dart';
import 'package:sermanos/features/postulate/application/controllers/volunteering_search_controller.dart';

part 'generated/focused_coordinate_controller.g.dart';

@Riverpod()
class FocusedCoordinateController extends _$FocusedCoordinateController {
  @override
  FutureOr<LatLng> build() async {
    final nearestVolunteering = await ref.watch(
      volunteeringSearchControllerProvider
          .selectAsync((vols) => vols.firstOrNull),
    );

    final userCoordinates =
        await ref.refresh(userPositionControllerProvider.future);

    if (nearestVolunteering == null) {
      return userCoordinates;
    }

    return LatLng(nearestVolunteering.lat, nearestVolunteering.lng);
  }

  void set(LatLng volunteeringCoordinates) {
    state = AsyncData(volunteeringCoordinates);
  }
}
