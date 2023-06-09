import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/router/router.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';

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
        .signInWithEmailAndPassword(email: email, password: password);

    resultEither.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (user) {
        ref.read(currentUserProvider.notifier).set(user);
        ref.read(mainBeamerDelegateProvider).popToNamed(PostulateScreen.route);
        state = const AsyncValue.data(null);
      },
    );
  }
}
