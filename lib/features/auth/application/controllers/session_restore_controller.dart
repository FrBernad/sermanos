import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/router/router.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';

import '../../../../config/logger/logger.dart';
import '../../../../config/providers.dart';
import '../../../user/providers.dart';

part 'generated/session_restore_controller.g.dart';

/// This will try to restore the session if the user is already logged in
/// setting authStateListenable value
@Riverpod(keepAlive: true)
Future<void> sessionRestoreController(
  SessionRestoreControllerRef ref,
) async {
  final firebaseAuthClient = ref.read(firebaseAuthProvider);
  final User? firebaseAuthUser = firebaseAuthClient.currentUser;
  logger.d("Trying to restore Firebase session");

  if (firebaseAuthUser != null) {
    /// Restore firebase user session
    try {
      /// Returns the current token if it has not expired. Otherwise, this will
      /// restore the token and return a new one.
      await firebaseAuthUser.getIdToken(true);

      final user = await ref
          .read(userRepositoryProvider)
          .getUserById(firebaseAuthUser.uid);

      await ref
          .read(firebaseAnalyticsProvider)
          .logEvent(name: "restored_session");

      ref.read(currentUserProvider.notifier).set(user.getRight().toNullable()!);

      ref.read(mainBeamerDelegateProvider).popToNamed(PostulateScreen.route);

      logger.d("Restored Firebase session");
    } catch (e) {
      logger.d("Error restoring Firebase session");
      ref.read(currentUserProvider.notifier).set(null);
      ref.read(mainBeamerDelegateProvider).popToNamed(SignInScreen.route);
    }
  } else {
    logger.d("Previous session not found");
  }
}
