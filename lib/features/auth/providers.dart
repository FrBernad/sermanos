import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';

part 'generated/providers.g.dart';

///
/// Data dependencies
///

@Riverpod(keepAlive: true)
AuthRepository authRepository(
  AuthRepositoryRef ref,
) =>
    AuthRepositoryImpl(
      ref: ref,
    );

///
/// Application dependencies
///
