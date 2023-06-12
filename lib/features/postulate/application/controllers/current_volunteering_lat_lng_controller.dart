import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/application/controllers/user_position_controller.dart';

part 'generated/current_volunteering_lat_lng_controller.g.dart';

@Riverpod()
class CurrentVolunteeringLatLngController
    extends _$CurrentVolunteeringLatLngController {
  @override
  LatLng build() {
    return ref.read(userPositionControllerProvider).value!;
  }

  void set(LatLng volunteeringCoordinates) {
    state = volunteeringCoordinates;
  }
}
