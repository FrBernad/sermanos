import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/providers.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/providers.dart';

import 'get_favorite_volunteerings_controller.dart';

part 'generated/add_favorite_volunteering_controller.g.dart';

@riverpod
class AddFavoriteVolunteeringController
    extends _$AddFavoriteVolunteeringController {
  @override
  Future<void> build() async {}

  Future<void> add({
    required String volunteeringId,
  }) async {
    state = const AsyncLoading();

    final AppUser currentUser = ref.read(currentUserProvider)!;

    final userDataEither = await ref
        .read(volunteeringRepositoryProvider)
        .addFavoriteVolunteering(
            userId: currentUser.id, volunteeringId: volunteeringId);

    state = await userDataEither.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      (user) async {
        await ref.refresh(getFavoriteVolunteeringsControllerProvider.future);
        return const AsyncValue.data(null);
      },
    );
  }
}
