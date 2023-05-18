import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../../../user/domain/models/user_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failure, void>> signOut();
}
