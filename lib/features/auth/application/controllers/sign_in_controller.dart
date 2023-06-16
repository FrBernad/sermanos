import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/router/router.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';

import '../../../../config/providers.dart';
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
        ref
            .read(firebaseAnalyticsProvider)
            .logLogin(loginMethod: 'email_and_password')
            .then((_) => {});
        ref.read(currentUserProvider.notifier).set(user);
        ref.read(mainBeamerDelegateProvider).popToNamed(WelcomeScreen.route);
        state = const AsyncValue.data(null);
      },
    );
  }
}
