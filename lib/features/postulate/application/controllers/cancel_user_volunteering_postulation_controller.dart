import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/application/controllers/get_volunteering_by_id_controller.dart';
import 'package:sermanos/features/postulate/providers.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/providers.dart';

import 'current_user_volunteering_controller.dart';

part 'generated/cancel_user_volunteering_postulation_controller.g.dart';

@riverpod
class CancelUserVolunteeringPostulationController
    extends _$CancelUserVolunteeringPostulationController {
  @override
  FutureOr<void> build() {}

  Future<void> cancel({
    required String volunteeringId,
  }) async {
    state = const AsyncLoading();

    final AppUser currentUser = ref.read(currentUserProvider)!;

    final userDataEither = await ref
        .read(volunteeringRepositoryProvider)
        .cancelUserVolunteeringPostulation(
          user: currentUser,
          volunteeringId: volunteeringId,
        );

    ref.invalidate(getVolunteeringByIdControllerProvider);

    state = userDataEither.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      (user) {
        ref.read(currentUserVolunteeringControllerProvider.notifier).set(null);
        return const AsyncValue.data(null);
      },
    );
  }
}
