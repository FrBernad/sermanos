import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/models/user_model.dart';
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
    throw UnimplementedError();

    // final userEntityOpt = await userLocalDataSource.getUserById(userId);
    // if (userEntityOpt.isNone()) {
    //   return const Left(UserNotFoundFailure());
    // }
    // final AppUser user = UserEntity.toModel(userEntityOpt.toNullable()!);
    // return Right(user);
  }

  @override
  Future<Either<Failure, AppUser>> createUser({
    required String email,
    required String userId,
  }) async {
    throw UnimplementedError();
    // final RemoteUserEntity userEntity;
    //
    // if (networkInfo.hasConnection) {
    //   userEntity = await userRemoteDataSource.createUser(
    //     id: userId,
    //     email: email,
    //   );
    // } else {
    //   return const Left(ConnectionFailure());
    // }
    //
    // try {
    //   await userLocalDataSource.createUser(
    //     userId: userId,
    //     email: email,
    //     lastModified: userEntity.lastModified,
    //   );
    // } on Exception {
    //   //FIXME: habria que borrar el usuario remoto
    // }
    //
    // await learnEmergencyRepository.createUserLearnProgresses(userId: userId);
    //
    // return Right(RemoteUserEntity.toModel(userEntity));
  }
}
