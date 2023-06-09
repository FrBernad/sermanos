import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_in_screen.dart';

import '../../../../config/router/router.dart';
import '../../../user/providers.dart';
import '../../providers.dart';

part 'generated/sign_out_controller.g.dart';

@riverpod
class SignOutController extends _$SignOutController {
  @override
  FutureOr<void> build() async {}

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    final resultEither = await ref.read(authRepositoryProvider).signOut();

    resultEither.fold(
      (l) => state = AsyncError(l.message, StackTrace.current),
      (r) {
        ref.read(currentUserProvider.notifier).set(null);
        ref.read(mainBeamerDelegateProvider).popToNamed(SignInScreen.route);
        state = const AsyncValue.data(null);
      },
    );
  }
}
