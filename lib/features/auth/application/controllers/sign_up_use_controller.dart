import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../user/providers.dart';
import '../../providers.dart';

part 'generated/sign_up_use_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build() async {}

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final resultEither = await ref
        .read(authRepositoryProvider)
        .signUpWithEmailAndPassword(email, password);

    resultEither.fold(
      (l) => state = AsyncError(l.message, StackTrace.current),
      (user) {
        // authStateListenable.value = true;
        ref.read(currentUserProvider.notifier).set(user);
        state = const AsyncValue.data(null);
      },
    );
  }
}
