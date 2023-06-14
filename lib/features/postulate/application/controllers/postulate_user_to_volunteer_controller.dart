import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/application/controllers/current_user_volunteering_controller.dart';
import 'package:sermanos/features/postulate/providers.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/providers.dart';

part 'generated/postulate_user_to_volunteer_controller.g.dart';

@riverpod
class PostulateUserToVolunteerController
    extends _$PostulateUserToVolunteerController {
  @override
  Future<void> build() async {}

  Future<void> postulate({
    required String volunteeringId,
  }) async {
    state = const AsyncLoading();

    final AppUser currentUser = ref.read(currentUserProvider)!;

    final userDataEither = await ref
        .read(volunteeringRepositoryProvider)
        .postulateUserToVolunteering(
          user: currentUser,
          volunteeringId: volunteeringId,
        );

    state = userDataEither.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      (_) {
        ref.read(currentUserVolunteeringControllerProvider.notifier).set(null);
        return const AsyncValue.data(null);
      },
    );
  }
}
