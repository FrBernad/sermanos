import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/application/controllers/get_favorite_volunteerings_controller.dart';
import 'package:sermanos/features/postulate/providers.dart';

import '../../../core/error/failure.dart';
import '../../domain/models/volunteering.dart';

part 'generated/volunteering_search_controller.g.dart';

@riverpod
class VolunteeringSearchController extends _$VolunteeringSearchController {
  Timer? _debounceTimer;

  @override
  Future<List<Volunteering>> build() async {
    await ref.watch(
        getFavoriteVolunteeringsControllerProvider.selectAsync((data) => null));

    ref.onDispose(() {
      if (_debounceTimer != null) _debounceTimer!.cancel();
    });

    final volunteeringEither = await _getVolunteering();

    return volunteeringEither.fold(
      (l) => throw l,
      (vols) => vols,
    );
  }

  Future<void> search({
    String? searchTerm,
  }) async {
    if (_debounceTimer != null) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 400), () async {
      final volunteeringEither = await _getVolunteering(searchTerm: searchTerm);

      state = await volunteeringEither.fold(
        (l) => AsyncValue.error(l.toString(), StackTrace.current),
        (vols) => AsyncValue.data(vols),
      );
    });
  }

  Future<Either<Failure, List<Volunteering>>> _getVolunteering({
    String? searchTerm,
  }) async {
    final volunteeringEither = await ref
        .read(volunteeringRepositoryProvider)
        .getVolunteerings(searchTerm: searchTerm);

    return volunteeringEither;
  }
}
