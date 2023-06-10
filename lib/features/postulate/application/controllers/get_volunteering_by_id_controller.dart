import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

import '../../providers.dart';

part 'generated/get_volunteering_by_id_controller.g.dart';

@riverpod
Future<Volunteering> getVolunteeringByIdController(
  GetVolunteeringByIdControllerRef ref, {
  required String volunteeringId,
}) async {
  final volunteeringRepository = ref.read(volunteeringRepositoryProvider);

  final volunteeringEither = await volunteeringRepository.getVolunteeringById(
      volunteeringId: volunteeringId);

  return volunteeringEither.fold((l) => throw Exception(l.message), (r) => r);
}
