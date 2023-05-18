import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../entities/remote/remote_user_entity.dart';

abstract interface class UserRemoteDataSource {
  Future<Option<RemoteUserEntity>> getUserById({
    required String id,
  });

  Future<RemoteUserEntity> createUser({
    required String id,
    required String email,
  });
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;

  final FirebaseFirestore _firebaseDatabaseClient;

  @override
  Future<Option<RemoteUserEntity>> getUserById({
    required String id,
  }) async {
    throw UnimplementedError();
    // final userDatabase = _firebaseDatabaseClient.ref('users/$id');
    //
    // final response = await userDatabase.get();
    // if (!response.exists) {
    //   return Option.none();
    // }
    //
    // return Option.of(
    //   RemoteUserEntity.fromJson(
    //     id,
    //     Map<String, dynamic>.from(response.value as dynamic),
    //   ),
    // );
  }

  @override
  Future<RemoteUserEntity> createUser({
    required String id,
    required String email,
  }) async {
    throw UnimplementedError();
    // final userDatabase = _firebaseDatabaseClient.ref('users/$id');
    //
    // final userDataMap = {
    //   'email': email,
    //   'lastModified': DateTime.now().millisecondsSinceEpoch,
    // };
    //
    // await userDatabase.set(userDataMap);
    //
    // return RemoteUserEntity.fromJson(id, userDataMap);
  }
}
