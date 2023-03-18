class FirebaseErrorCodes {
  ///Thrown if the email address is not valid.
  static const String invalidEmail = 'invalid-email';

  ///Thrown if the  user corresponding to the given email has been disabled.
  static const String userDisabled = 'user-disabled';

  ///Thrown if there is no user corresponding to the given email.
  static const String userNotFound = 'user-not-found';

  ///Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
  static const String wrongPassword = 'wrong-password';

  ///Thrown if there already exists an account with the given email address.
  static const String emailAlreadyInUse = 'email-already-in-use';

  ///Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
  static const String operationNotAllowed = 'operation-not-allowed';

  ///Thrown if the password is not strong enough.
  static const String weakPassword = 'weak-password';
}
