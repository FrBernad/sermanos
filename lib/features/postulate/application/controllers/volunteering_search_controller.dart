import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

    final emergenciesEither = await _getVolunteering();

    return emergenciesEither.fold(
      (l) => throw l,
      (vols) => vols,
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
        (vols) => AsyncValue.data(vols),
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
