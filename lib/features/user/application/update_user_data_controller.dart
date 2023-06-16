import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/core/error/failure.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/domain/models/user_data_dto.dart';
import 'package:sermanos/features/user/providers.dart';

part 'generated/update_user_data_controller.g.dart';

@riverpod
class UpdateUserDataController extends _$UpdateUserDataController {
  @override
  Future<void> build() async {}

  Future<bool> updateUser({
    required UserDataDto userData,
  }) async {
    state = const AsyncLoading();

    final AppUser currentUser = ref.read(currentUserProvider)!;

    final userDataEither = await ref
        .read(userRepositoryProvider)
        .updateUserData(userData: userData, userId: currentUser.id);

    bool success = false;
    state = userDataEither.fold(
      (l) {
        String message = l.toString();
        Type t = l.runtimeType;
        if (t == UserNotFoundFailure) {
          message = "No se pudo encontrar tu usuario";
        }
        return AsyncValue.error(message, StackTrace.current);
      },
      (user) {
        ref.read(currentUserProvider.notifier).set(user);
        success = true;
        return const AsyncValue.data(null);
      },
    );

    return success;
  }
}
