import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../user/providers.dart';
import '../../providers.dart';

part 'generated/sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() async {}

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final resultEither = await ref
        .read(authRepositoryProvider)
        .signInWithEmailAndPassword(email, password);

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