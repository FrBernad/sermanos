import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../models/user_model.dart';

abstract interface class UserRepository {
  Future<Either<Failure, AppUser>> getUserById(String userId);

  Future<Either<Failure, AppUser>> createUser({
    required String userId,
    required String email,
  });
}
