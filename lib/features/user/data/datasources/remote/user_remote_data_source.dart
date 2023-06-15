import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/user/domain/models/user_data_dto.dart';
import 'package:uuid/uuid.dart';

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
    required AppUserEntity user,
    required UserDataDto userData,
  });
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl({
    required FirebaseFirestore firebaseDatabaseClient,
    required FirebaseStorage firebaseStorageClient,
  })  : _firebaseDatabaseClient = firebaseDatabaseClient,
        _firebaseStorageClient = firebaseStorageClient;

  final FirebaseFirestore _firebaseDatabaseClient;
  final FirebaseStorage _firebaseStorageClient;

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
    required AppUserEntity user,
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

    //Hay que borrar la foto de perfil anterior si es que hay y subir una nueva al storage

    if (userData.profileImage != null) {
      try {
        if (user.profileImageUrl != null) {
          final storageRef =
              _firebaseStorageClient.refFromURL(user.profileImageUrl!);
          await storageRef.delete();
        }

        String id = const Uuid().v4();
        final fileReference =
            _firebaseStorageClient.ref().child("profileImage/$id");

        await fileReference.putFile(userData.profileImage!);
        userDataMap['profileImage'] = await fileReference.getDownloadURL();
      } on FirebaseException catch (e) {
        throw Exception("Error when uploading file");
      }
    }

    await query.update(userDataMap);
  }
}
