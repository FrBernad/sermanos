import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/core/error/exception.dart';
import 'package:sermanos/features/postulate/data/entities/postulation_entity.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_entity.dart';
import 'package:sermanos/features/postulate/domain/models/postulation.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';

import '../../../core/error/failure.dart';
import '../../domain/repositories/volunteering_repository.dart';
import '../datasources/remote/volunteering_remote_data_source.dart';

class VolunteeringRepositoryImpl implements VolunteeringRepository {
  VolunteeringRepositoryImpl({
    required this.volunteeringDataSource,
  });

  final VolunteeringRemoteDataSource volunteeringDataSource;

  @override
  Future<Either<Failure, List<Volunteering>>> getVolunteerings({
    required String? searchTerm,
  }) async {
    List<Volunteering> volunteering = [];
    try {
      final List<VolunteeringEntity> volunteeringEntities =
          await volunteeringDataSource.getVolunteerings(searchTerm: searchTerm);

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

// @override
// Future<Either<Failure, List<Volunteering>>>
//     getCurrentSuscribedVolunteeringsByUserId({
//   required AppUser user,
//   required String volunteeringId,
// }) async {
//   try {
//     final List<VolunteeringEntity> volunteeringEntity =
//         await volunteeringDataSource.getVolunteeringById(
//       volunteeringId: volunteeringId,
//     );
//
//     if (volunteeringEntity.isNone()) {
//       return const Left(VolunteeringNotFoundFailure());
//     }
//     return Right(volunteeringEntity.toNullable()!.toModel());
//   } on Exception {
//     return const Left(ConnectionFailure());
//   }
// }
//
// @override
// Future<Either<Failure, List<Postulation>>> getCurrentPostulationsByUserId({
//   required String userId,
//   required String volunteeringId,
// }) async {
//   try {
//     final List<VolunteeringEntity> volunteeringEntity =
//         await volunteeringDataSource.getVolunteeringById(
//       volunteeringId: volunteeringId,
//     );
//
//     if (volunteeringEntity.isNone()) {
//       return const Left(VolunteeringNotFoundFailure());
//     }
//     return Right(volunteeringEntity.toNullable()!.toModel());
//   } on Exception {
//     return const Left(ConnectionFailure());
//   }
// }
//
// @override
// Future<Either<Failure, Postulation>> getPostulationByVolunteeringId({
//   required AppUser user,
//   required String volunteeringId,
// }) async {
//   try {
//     final Option<VolunteeringEntity> volunteeringEntity =
//         await volunteeringDataSource.getVolunteeringById(
//       volunteeringId: volunteeringId,
//     );
//
//     if (volunteeringEntity.isNone()) {
//       return const Left(VolunteeringNotFoundFailure());
//     }
//
//     final PostulationEntity postulationEntity =
//         await volunteeringDataSource.getPostulationByVolunteeringId(
//       volunteeringId: volunteeringId,
//     );
//
//     return Right(postulationEntity.toModel());
//   } on Exception {
//     return const Left(ConnectionFailure());
//   }

  @override
  Future<Either<Failure, void>> subscribeToVolunteering({
    required AppUser user,
    required String volunteeringId,
  }) async {
    try {
      await volunteeringDataSource.subscribeToVolunteering(
          user: user, volunteeringId: volunteeringId);
      return const Right(null);
    } on NotFoundException {
      return const Left(VolunteeringNotFoundFailure());
    } on AlreadySubscribedInAVolunteeringException {
      return const Left(AlreadySubscribedInAVolunteeringFailure());
    } on NoVacancyAtVolunteeringException {
      return const Left(NoVacancyAtVolunteeringFailure());
    } on Exception {
      return const Left(ConnectionFailure());
    }
  }
//
// @override
// Future<Either<Failure, void>> unsubscribeFromVolunteeringByVolunteeringId({
//   required AppUser user,
//   required String volunteeringId,
// }) async {
//   try {
//     await volunteeringDataSource.unsuscribeFromVolunteeringById(
//         user, volunteeringId);
//     return const Right(null);
//   } on NoVacancyAtVolunteeringException {
//     return const Left(NoVacancyAtVolunteeringFailure());
//   } on Exception {
//     return const Left(ConnectionFailure());
//   }
// }
}
