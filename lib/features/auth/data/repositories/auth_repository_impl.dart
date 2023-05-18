import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../../../user/domain/models/user_model.dart';
import '../../../user/domain/repositories/user_repository.dart';
import '../../../user/providers.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required Ref ref,
  })  : authClient = firebase.FirebaseAuth.instance,
        userRepository = ref.read(userRepositoryProvider),
        providerRef = ref;

  firebase.FirebaseAuth authClient;
  UserRepository userRepository;
  Ref providerRef;

  @override
  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredentials = await authClient.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userEither = await userRepository.createUser(
        email: userCredentials.user!.email!,
        userId: userCredentials.user!.uid,
      );

      return Right(userEither.getRight().toNullable()!);
    } on firebase.FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    throw UnimplementedError();
    // try {
    //   final userCredentials = await authClient.signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    //
    //   return Right(userEither.getRight().toNullable()!);
    // } on firebase.FirebaseAuthException catch (e) {
    //   return Left(FirebaseAuthFailure(message: e.code));
    // }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    throw UnimplementedError();
    //
    // try {
    //   // final secureStore = providerRef.read(secureStoreProvider);
    //   String? anonUserSession = await secureStore.read(key: 'anonUserSession');
    //   if (anonUserSession != null) {
    //     await secureStore.delete(key: 'anonUserSession');
    //   } else {
    //     await authClient.signOut();
    //   }
    // } on firebase.FirebaseAuthException {
    //   return const Left(ServerFailure());
    // }
    // return const Right(null);
  }
}
