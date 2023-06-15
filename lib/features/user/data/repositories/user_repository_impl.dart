import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/user/data/entities/app_user_entity.dart';
import 'package:sermanos/features/user/domain/models/user_data_dto.dart';

import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/models/app_user_model.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AppUser>> getUserById(String userId) async {
    final userEntityOpt =
        await userRemoteDataSource.getUserById(userId: userId);

    if (userEntityOpt.isNone()) {
      return const Left(UserNotFoundFailure());
    }

    return Right(userEntityOpt.toNullable()!.toModel());
  }

  @override
  Future<Either<Failure, AppUser>> createUser({
    required String userId,
    required String name,
    required String surname,
    required String email,
  }) async {
    final AppUserEntity userEntity;

    // if (networkInfo.hasConnection) {
    userEntity = await userRemoteDataSource.createUser(
      userId: userId,
      name: name,
      surname: surname,
      email: email,

    );
    // } else {
    //   return const Left(ConnectionFailure());
    // }

    return Right(userEntity.toModel());
  }

  @override
  Future<Either<Failure, AppUser>> updateUserData({
    required String userId,
    required UserDataDto userData,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        Option<AppUserEntity> userEntityOpt =
            await userRemoteDataSource.getUserById(userId: userId);

        if (userEntityOpt.isNone()) {
          return const Left(UserNotFoundFailure());
        }

        await userRemoteDataSource.updateUser(
          userId: userId,
          user: userEntityOpt.toNullable()!,
          userData: userData,
        );

        userEntityOpt = await userRemoteDataSource.getUserById(userId: userId);

        return Right(userEntityOpt.toNullable()!.toModel());
      } on Exception {
        return const Left(ConnectionFailure());
      }
    } else {
      return const Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> allowEventPermission({
    required String userId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        Option<AppUserEntity> userEntityOpt =
            await userRemoteDataSource.getUserById(userId: userId);

        if (userEntityOpt.isNone()) {
          return const Left(UserNotFoundFailure());
        }

        await userRemoteDataSource.updateUserEventPermission(
          userId: userId,
        );

        userEntityOpt = await userRemoteDataSource.getUserById(userId: userId);
        return Right(userEntityOpt.toNullable()!.toModel());
      } on Exception {
        return const Left(ConnectionFailure());
      }
    } else {
      return const Left(ConnectionFailure());
    }
  }
}
