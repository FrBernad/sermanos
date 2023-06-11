import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_carousel.dart';

import '../../../../config/design_system/atoms/icons/sermanos_icons.dart';
import '../../../../config/design_system/molecules/buttons/sermanos_floating_button.dart';
import '../../../../config/design_system/molecules/inputs/sermanos_search_bar.dart';
import '../../../../config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../core/presentation/widgets/error_message.dart';
import '../../application/controllers/get_volunteering_controller.dart';
import '../../domain/models/volunteering.dart';
import '../../providers.dart';
import 'no_volunteering_available.dart';

class PostulateMapView extends HookConsumerWidget {
  const PostulateMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringController = ref.watch(getVolunteeringControllerProvider);
    final currentVolunteeringIndex =
        ref.watch(currentVolunteeringIndexProvider);

    final mapController = useState<GoogleMapController?>(null);

    return volunteeringController.when(
      data: (volunteerings) {
        if (volunteerings.isEmpty) {
          return const NoVolunteeringAvailable();
        }

        if (mapController.value != null) {
          mapController.value!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                  volunteerings[currentVolunteeringIndex].lat,
                  volunteerings[currentVolunteeringIndex].lng,
                ),
                zoom: 15,
              ),
            ),
          );
        }

        return Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    volunteerings[currentVolunteeringIndex].lat,
                    volunteerings[currentVolunteeringIndex].lng,
                  ),
                  zoom: 15,
                ),
                markers: volunteeringToMarkers(volunteerings),
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController.value = controller;
                },
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      SizedBox(height: 24),
                      SermanosGrid(child: SermanosSearchBar()),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SermanosGrid(
                          child: SermanosFloatingActionButton(
                            icon: SermanosIcons.nearMeFilled(
                              status: SermanosIconStatus.activated,
                            ),
                            onPressed: () async {
                              final position = await _determinePosition();
                              mapController.value!.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(
                                      position.latitude,
                                      position.longitude,
                                    ),
                                    zoom: 15,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PostulateCarousel(volunteerings: volunteerings),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }

  Set<Marker> volunteeringToMarkers(List<Volunteering> volunteerings) {
    Set<Marker> markers = {};

    for (Volunteering volunteering in volunteerings) {
      markers.add(Marker(
        markerId: MarkerId(volunteering.id),
        position: LatLng(
          volunteering.lat,
          volunteering.lng,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    }

    return markers;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
