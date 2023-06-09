import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../entities/app_user_entity.dart';

abstract interface class UserRemoteDataSource {
  Future<Option<AppUserEntity>> getUserById({
    required String userId,
  });

  Future<AppUserEntity> createUser({
    required String userId,
    required String name,
    required String surname,
    required String email,
  });
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;

  final FirebaseFirestore _firebaseDatabaseClient;

  @override
  Future<Option<AppUserEntity>> getUserById({
    required String userId,
  }) async {
    final query = _firebaseDatabaseClient
        .collection(AppUserEntity.collectionName)
        .doc(userId);

    final response = await query.get();
    if (!response.exists) {
      return const None();
    }

    return Option.of(
      AppUserEntity.fromJson(
        userId,
        response.data()!,
      ),
    );
  }

  @override
  Future<AppUserEntity> createUser({
    required String userId,
    required String name,
    required String surname,
    required String email,
  }) async {
    final query = _firebaseDatabaseClient
        .collection(AppUserEntity.collectionName)
        .doc(userId);

    final userDataMap = {
      'name': name,
      'surname': surname,
      'email': email,
    };

    await query.set(userDataMap);

    return AppUserEntity.fromJson(
      userId,
      userDataMap,
    );
  }
}
