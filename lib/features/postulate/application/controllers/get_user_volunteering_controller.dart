import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/application/controllers/current_user_volunteering_controller.dart';
import 'package:sermanos/features/user/providers.dart';

import '../../providers.dart';

part 'generated/get_user_volunteering_controller.g.dart';

@riverpod
Future<void> getUserVolunteeringController(
  GetUserVolunteeringControllerRef ref,
) async {
  final volunteeringRepository = ref.read(volunteeringRepositoryProvider);

  final currentUser = ref.read(currentUserProvider);

  final volunteeringEither = await volunteeringRepository.getUserVolunteering(
    userId: currentUser!.id,
  );

  return volunteeringEither.fold(
    (l) => throw Exception(l.message),
    (r) => ref
        .read(currentUserVolunteeringControllerProvider.notifier)
        .set(r.toNullable()),
  );
}
