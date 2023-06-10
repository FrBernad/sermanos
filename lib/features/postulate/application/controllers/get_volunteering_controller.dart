import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/error/failure.dart';
import '../../domain/models/volunteering.dart';
import '../../providers.dart';

part 'generated/get_volunteering_controller.g.dart';

@riverpod
class GetVolunteeringController extends _$GetVolunteeringController {
  @override
  Future<List<Volunteering>> build() async {
    final volunteeringEither = await _getVolunteering();

    return volunteeringEither.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  Future<Either<Failure, List<Volunteering>>> _getVolunteering() async {
    final volunteeringRepository = ref.read(volunteeringRepositoryProvider);

    final volunteeringEither = await volunteeringRepository.getVolunteering();

    return volunteeringEither;
  }
}
