import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/providers.dart';

part 'generated/update_user_event_permission_controller.g.dart';

@riverpod
class UpdateUserEventPermissionController
    extends _$UpdateUserEventPermissionController {
  @override
  Future<void> build() async {}

  Future<void> allowEventPermission() async {
    state = const AsyncLoading();

    final AppUser currentUser = ref.read(currentUserProvider)!;

    final userDataEither = await ref
        .read(userRepositoryProvider)
        .allowEventPermission(userId: currentUser.id);

    state = userDataEither.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      (user) {
        ref.read(currentUserProvider.notifier).set(user);
        return const AsyncValue.data(null);
      },
    );
  }
}
