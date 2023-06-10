import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/providers.dart';
import 'package:sermanos/features/postulate/data/datasources/remote/volunteering_remote_data_source.dart';
import 'package:sermanos/features/postulate/data/repository/volunteering_repository_impl.dart';
import 'package:sermanos/features/postulate/domain/repositories/volunteering_repository.dart';

part 'generated/providers.g.dart';

///
/// Data dependencies
///
@Riverpod(keepAlive: true)
VolunteeringRemoteDataSource volunteeringRemoteDataSource(
  VolunteeringRemoteDataSourceRef ref,
) =>
    VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: ref.watch(firebaseDatabaseProvider),
    );

@Riverpod(keepAlive: true)
VolunteeringRepository volunteeringRepository(VolunteeringRepositoryRef ref) =>
    VolunteeringRepositoryImpl(
      volunteeringDataSource: ref.watch(volunteeringRemoteDataSourceProvider),
    );

///
/// Application dependencies
///
