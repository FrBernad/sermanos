import 'package:flutter/cupertino.dart';

import '../error/firebase_error_codes.dart';

class FirebaseAuthErrorTranslator {
  static String translate(BuildContext context, String errorCode) {
    switch (errorCode) {
      case FirebaseErrorCodes.invalidEmail:
        return "Email invalido";
      case FirebaseErrorCodes.userDisabled:
        return "Usuario deshabilitado";
      case FirebaseErrorCodes.userNotFound:
        return "Email o constraseña incorrectos";
      case FirebaseErrorCodes.wrongPassword:
        return "Email o constraseña incorrectos";
      case FirebaseErrorCodes.emailAlreadyInUse:
        return "Ya existe un usuario registrado bajo ese email";
      case FirebaseErrorCodes.operationNotAllowed:
        return "Operacion no habilitada";
      case FirebaseErrorCodes.weakPassword:
        return "Contraseña debil";
    }
    return "Algo salió mal, intenta denuevo más tarde";
  }
}
