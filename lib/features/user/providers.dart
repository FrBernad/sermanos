// Data
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/providers.dart';

import 'data/datasources/remote/user_remote_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/models/user_model.dart';
import 'domain/repositories/user_repository.dart';

part 'generated/providers.g.dart';

///
/// Data dependencies
///

@Riverpod(keepAlive: true)
UserRemoteDataSource userRemoteDataSource(
  UserRemoteDataSourceRef ref,
) =>
    UserRemoteDataSourceImpl(
      firebaseDatabaseClient: ref.watch(firebaseDatabaseProvider),
    );

@Riverpod(keepAlive: true)
UserRepository userRepository(
  UserRepositoryRef ref,
) =>
    UserRepositoryImpl(
      userRemoteDataSource: ref.watch(userRemoteDataSourceProvider),
      networkInfo: ref.watch(networkInfoProvider),
    );

///
/// Application dependencies
///

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  AppUser? build() {
    return null;
  }

  void set(AppUser? user) {
    state = user;
  }
}
