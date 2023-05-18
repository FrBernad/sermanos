import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../user/providers.dart';
import '../../providers.dart';

part 'generated/sign_out_controller.g.dart';

@Riverpod()
class SignOutController extends _$SignOutController {
  @override
  FutureOr<void> build() async {}

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    final resultEither = await ref.read(authRepositoryProvider).signOut();

    resultEither.fold(
      (l) => state = AsyncError(l.message, StackTrace.current),
      (r) {
        // authStateListenable.value = false;
        ref.read(currentUserProvider.notifier).set(null);
        state = const AsyncValue.data(null);
      },
    );
  }
}
