import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/user/domain/models/user_data_dto.dart';

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

  Future<void> updateUser({
    required String userId,
    required UserDataDto userData,
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

  @override
  Future<void> updateUser({
    required String userId,
    required UserDataDto userData,
  }) async {
    final query = _firebaseDatabaseClient
        .collection(AppUserEntity.collectionName)
        .doc(userId);

    final userDataMap = {
      'birthdate': userData.birthdate.millisecondsSinceEpoch,
      'emailContact': userData.emailContact,
      'gender': userData.gender.name,
      'phone': userData.phone,
    };

    await query.update(userDataMap);
  }
}
