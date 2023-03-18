import 'package:flutter/cupertino.dart';
import 'package:ser_manos/features/core/utils/extensions/build_context_extensions.dart';

import '../error/firebase_error_codes.dart';

class FirebaseAuthErrorTranslator {
  static String translate(BuildContext context, String errorCode) {
    switch (errorCode) {
      case FirebaseErrorCodes.invalidEmail:
        return context.tr.invalidEmail;
      case FirebaseErrorCodes.userDisabled:
        return context.tr.userDisabled;
      case FirebaseErrorCodes.userNotFound:
        return context.tr.userNotFound;
      case FirebaseErrorCodes.wrongPassword:
        return context.tr.wrongPassword;
      case FirebaseErrorCodes.emailAlreadyInUse:
        return context.tr.emailAlreadyInUse;
      case FirebaseErrorCodes.operationNotAllowed:
        return context.tr.operationNotAllowed;
      case FirebaseErrorCodes.weakPassword:
        return context.tr.weakPassword;
    }
    return context.tr.unknownAuthError;
  }
}
