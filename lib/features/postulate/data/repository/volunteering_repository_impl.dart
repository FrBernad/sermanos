import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_entity.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

import '../../../core/error/failure.dart';
import '../../domain/repositories/volunteering_repository.dart';
import '../datasources/remote/volunteering_remote_data_source.dart';

class VolunteeringRepositoryImpl implements VolunteeringRepository {
  VolunteeringRepositoryImpl({
    required this.volunteeringDataSource,
  });

  final VolunteeringRemoteDataSource volunteeringDataSource;

  @override
  Future<Either<Failure, List<Volunteering>>> getVolunteering() async {
    List<Volunteering> volunteering = [];
    try {
      final List<VolunteeringEntity> volunteeringEntities =
          await volunteeringDataSource.getVolunteering();

      volunteering = volunteeringEntities.map((n) => n.toModel()).toList();
    } on Exception {
      return const Left(ConnectionFailure());
    }

    return Right(volunteering);
  }

  @override
  Future<Either<Failure, Volunteering>> getVolunteeringById({
    required String volunteeringId,
  }) async {
    try {
      final Option<VolunteeringEntity> volunteeringEntity =
          await volunteeringDataSource.getVolunteeringById(
        volunteeringId: volunteeringId,
      );

      if (volunteeringEntity.isNone()) {
        return const Left(VolunteeringNotFoundFailure());
      }
      return Right(volunteeringEntity.toNullable()!.toModel());
    } on Exception {
      return const Left(ConnectionFailure());
    }
  }
}
