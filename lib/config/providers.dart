import 'dart:async';

import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/http_clients/dio_interceptor.dart';

import '../flavors.dart';
import 'env/env.dart';

///
/// Env Dependencies
///
final envProvider = Provider(
  name: 'environmentVariablesProvider',
  (ref) => EnvImpl(),
);

///
/// Data Dependencies
///
final dioProvider = Provider(
  name: 'dioProvider',
  (ref) {
    var env = ref.watch(envProvider);
    var options = BaseOptions(
      baseUrl: env.apiBaseUrl,
    );

    var dio = Dio(options);
    if (F.appFlavor == Flavor.development) {
      dio.interceptors.add(DioInterceptor());
    }

    return dio;
  },
);
//
// final firebaseAuthProvider = Provider(
//   name: 'firebaseAuthClientProvider',
//   (ref) {
//     return FirebaseAuth.instance;
//   },
// );
//
// final firebaseDatabaseProvider = Provider(
//   name: 'firebaseDatabaseClientProvider',
//   (ref) {
//     // FirebaseDatabase.instance.setPersistenceEnabled(false);
//     return FirebaseDatabase.instance;
//   },
// );

///
/// Providers initialization for boostrap file
///
Future<void> initializeProviders(ProviderContainer container) async {
  /// Env
  await dotenv.load(fileName: F.envFileName);
  container.read(envProvider); // read to initialize

  /// Dio Setup
  container.read(dioProvider);

  /// Firebase Auth Setup
  // container.read(firebaseAuthProvider);

  /// Firebase Database Setup
  // container.read(firebaseDatabaseProvider);
}
