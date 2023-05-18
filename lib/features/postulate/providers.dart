import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/providers.dart';
import 'package:sermanos/features/postulate/data/datasources/remote/social_actions_remote_data_source.dart';
import 'package:sermanos/features/postulate/data/repository/social_actions_repository_impl.dart';
import 'package:sermanos/features/postulate/domain/repositories/social_actions_repository.dart';

part 'generated/providers.g.dart';

///
/// Data dependencies
///

@Riverpod(keepAlive: true)
SocialActionsRemoteDataSource socialActionsRemoteDataSource(
  SocialActionsRemoteDataSourceRef ref,
) =>
    SocialActionsRemoteDataSourceImpl(
      firebaseDatabaseClient: ref.watch(firebaseDatabaseProvider),
    );

@Riverpod(keepAlive: true)
SocialActionsRepository socialActionsRepository(
        SocialActionsRepositoryRef ref) =>
    SocialActionsRepositoryImpl(
      socialActionsDataSource: ref.watch(socialActionsRemoteDataSourceProvider),
    );

///
/// Application dependencies
///
