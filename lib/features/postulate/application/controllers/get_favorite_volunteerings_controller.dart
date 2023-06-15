import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/user/providers.dart';

import '../../providers.dart';

part 'generated/get_favorite_volunteerings_controller.g.dart';

@riverpod
Future<List<String>> getFavoriteVolunteeringsController(
  GetFavoriteVolunteeringsControllerRef ref,
) async {
  final volunteeringRepository = ref.read(volunteeringRepositoryProvider);

  final currentUser = ref.read(currentUserProvider);

  final favoriteVolunteeringsEither =
      await volunteeringRepository.getFavoriteVolunteerings(
    userId: currentUser!.id,
  );

  return favoriteVolunteeringsEither.fold(
      (l) => throw Exception(l.message), (r) => r);
}
