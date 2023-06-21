import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/providers.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';

import '../../../../config/router/router.dart';
import '../../../user/providers.dart';
import '../../providers.dart';

part 'generated/sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build() async {}

  Future<void> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final resultEither =
        await ref.read(authRepositoryProvider).signUpWithEmailAndPassword(
              name: name,
              surname: surname,
              email: email,
              password: password,
            );

    resultEither.fold(
      (l) => state = AsyncError(l.message, StackTrace.current),
      (user) async {
        ref.read(currentUserProvider.notifier).set(user);
        await ref.read(firebaseAnalyticsProvider).logSignUp(
              signUpMethod: 'email_and_password',
            );
        ref.read(mainBeamerDelegateProvider).popToNamed(WelcomeScreen.route);
        state = const AsyncValue.data(null);
      },
    );
  }
}
