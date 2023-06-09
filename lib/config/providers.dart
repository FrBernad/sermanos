import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/application/controllers/session_restore_controller.dart';
import '../features/core/platform/network_info.dart';
import '../flavors.dart';
import 'env/env.dart';
import 'http_clients/dio_interceptor.dart';

part 'generated/providers.g.dart';

///
/// Env Dependencies
///
@Riverpod(keepAlive: true)
Env env(EnvRef ref) => EnvImpl();

///
/// Data Dependencies
///
@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  var dio = Dio();
  if (F.appFlavor == Flavor.development) {
    dio.interceptors.add(DioInterceptor());
  }

  return dio;
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseDatabase(FirebaseDatabaseRef ref) {
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
NetworkInfo networkInfo(NetworkInfoRef ref) {
  final networkInfo = NetworkInfo();
  ref.onDispose(networkInfo.dispose);
  return networkInfo;
}

///
/// Providers initialization for boostrap file
///
Future<void> initializeProviders(ProviderContainer container) async {
  /// Env
  await dotenv.load(fileName: F.envFileName);
  container.read(envProvider);

  /// Dio Setup
  container.read(dioProvider);

  /// Network Info Setup
  final networkInfo = container.read(networkInfoProvider);
  await networkInfo.initialize();

  /// Firebase Auth Setup
  container.read(firebaseAuthProvider);

  /// Firebase Database Setup
  container.read(firebaseDatabaseProvider);

  /// Try Session Restore
  await container.read(sessionRestoreControllerProvider.future);
}
