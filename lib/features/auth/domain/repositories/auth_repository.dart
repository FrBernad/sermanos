import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../../../user/domain/models/app_user_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword({
    required String name,
    required String surname,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();
}
