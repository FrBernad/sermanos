import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/application/controllers/current_volunteering_lat_lng_controller.dart';
import 'package:sermanos/features/postulate/application/controllers/user_position_controller.dart';
import 'package:sermanos/features/postulate/providers.dart';

import '../../../core/error/failure.dart';
import '../../domain/models/volunteering.dart';

part 'generated/volunteering_search_controller.g.dart';

@riverpod
class VolunteeringSearchController extends _$VolunteeringSearchController {
  Timer? _debounceTimer;

  @override
  Future<List<Volunteering>> build() async {
    ref.onDispose(() {
      if (_debounceTimer != null) _debounceTimer!.cancel();
    });

    await ref.refresh(userPositionControllerProvider.future);

    final emergenciesEither = await _getVolunteering();

    return emergenciesEither.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  Future<void> search({
    String? searchTerm,
  }) async {
    if (_debounceTimer != null) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 400), () async {
      final emergenciesEither = await _getVolunteering(searchTerm: searchTerm);

      state = await emergenciesEither.fold(
        (l) => AsyncValue.error(l.toString(), StackTrace.current),
        (vols) async {
          if (vols.isEmpty) {
            await ref.refresh(userPositionControllerProvider.future);
          } else {
            final coordinates = LatLng(vols[0].lat, vols[0].lng);
            ref
                .watch(currentVolunteeringLatLngControllerProvider.notifier)
                .set(coordinates);
          }
          return AsyncValue.data(vols);
        },
      );
    });
  }

  Future<Either<Failure, List<Volunteering>>> _getVolunteering({
    String? searchTerm,
  }) async {
    final emergenciesEither = await ref
        .read(volunteeringRepositoryProvider)
        .getVolunteering(searchTerm: searchTerm);

    return emergenciesEither;
  }
}
