import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/user/domain/models/user_data_dto.dart';

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

  Future<Either<Failure, AppUser>> updateUserData({
    required String userId,
    required UserDataDto userData,
  });

  Future<Either<Failure, AppUser>> allowEventPermission({
    required String userId,
  });
}
