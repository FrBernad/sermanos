import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../models/app_user_model.dart';

abstract interface class UserRepository {
  Future<Either<Failure, AppUser>> getUserById(String userId);

  Future<Either<Failure, AppUser>> createUser({
    required String userId,
    required String name,
    required String surname,
    required String email,
  });
}
