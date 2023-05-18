import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../config/providers.dart';

part 'generated/session_restore_controller.g.dart';

/// This will try to restore the session if the user is already logged in
/// setting authStateListenable value
@Riverpod(keepAlive: true)
Future<void> sessionRestoreController(
  SessionRestoreControllerRef ref,
) async {
  throw UnimplementedError();
  // final firebaseAuthClient = ref.read(firebaseAuthProvider);
  // final User? firebaseAuthUser = firebaseAuthClient.currentUser;
  //
  // /// Refresh firebase user
  // try {
  //   /// Returns the current token if it has not expired. Otherwise, this will
  //   /// refresh the token and return a new one.
  //   await firebaseAuthUser.getIdToken(true);
  //
  //   final user = await ref
  //       .read(userRepositoryProvider)
  //       .synchronizeUserData(userId: firebaseAuthUser.uid);
  //
  //   ref.read(currentUserProvider.notifier).set(user.getRight().toNullable()!);
  //
  //   authStateListenable.value = true;
  //
  //   logger.d("Refreshed Firebase session");
  // } catch (e) {
  //   logger.d("Error refreshing Firebase session");
  //   authStateListenable.value = false;
  // }
}
