import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sermanos/features/core/error/exception.dart';
import 'package:sermanos/features/core/error/failure.dart';
import 'package:sermanos/features/core/platform/network_info.dart';
import 'package:sermanos/features/postulate/data/datasources/remote/volunteering_remote_data_source.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_entity.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_reduced_entity.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering_reduced.dart';
import 'package:sermanos/features/postulate/domain/repositories/volunteering_repository.dart';
import 'package:sermanos/features/postulate/providers.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';

import '../../application/controllers/user_position_controller.dart';

class VolunteeringRepositoryImpl implements VolunteeringRepository {
  VolunteeringRepositoryImpl({
    required this.volunteeringDataSource,
    required this.networkInfo,
    required this.ref,
  });

  final VolunteeringRemoteDataSource volunteeringDataSource;
  final NetworkInfo networkInfo;
  final VolunteeringRepositoryRef ref;

  @override
  Future<Either<Failure, List<Volunteering>>> getVolunteerings({
    required String? searchTerm,
  }) async {
    if (networkInfo.hasConnection) {
      List<Volunteering> volunteering = [];
      try {
        final locationPermission =
            await ref.refresh(locationPermissionProvider.future);

        LatLng? userPosition = locationPermission.isGranted
            ? await ref.refresh(userPositionControllerProvider.future)
            : null;

        final List<VolunteeringEntity> volunteeringEntities =
            await volunteeringDataSource.getVolunteerings(
          searchTerm: searchTerm,
          userPosition: userPosition,
        );

        volunteering = volunteeringEntities.map((n) => n.toModel()).toList();
      } on Exception {
        return const Left(ServerFailure());
      }
      return Right(volunteering);
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, Volunteering>> getVolunteeringById({
    required String volunteeringId,
  }) async {
    if (networkInfo.hasConnection) {
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
        return const Left(ServerFailure());
      }
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, Option<VolunteeringReduced>>> getUserVolunteering({
    required String userId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        final Option<VolunteeringReducedEntity> volunteeringEntity =
            await volunteeringDataSource.getUserVolunteering(
          userId: userId,
        );

        if (volunteeringEntity.isNone()) {
          return const Right(Option.none());
        }
        return Right(Option.of(volunteeringEntity.toNullable()!.toModel()));
      } on Exception {
        return const Left(ServerFailure());
      }
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, void>> postulateUserToVolunteering({
    required AppUser user,
    required String volunteeringId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        await volunteeringDataSource.postulateUserToVolunteering(
          user: user,
          volunteeringId: volunteeringId,
        );
        return const Right(null);
      } on NotFoundException {
        return const Left(VolunteeringNotFoundFailure());
      } on NoVacancyAtVolunteeringException {
        return const Left(NoVacancyAtVolunteeringFailure());
      } on Exception {
        return const Left(ServerFailure());
      }
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, void>> cancelUserVolunteeringPostulation({
    required AppUser user,
    required String volunteeringId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        await volunteeringDataSource.cancelUserVolunteeringPostulation(
          user: user,
          volunteeringId: volunteeringId,
        );
        return const Right(null);
      } on NotFoundException {
        return const Left(VolunteeringNotFoundFailure());
      } on Exception {
        return const Left(ConnectionFailure());
      }
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, void>> cancelUserVolunteering({
    required AppUser user,
    required String volunteeringId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        await volunteeringDataSource.cancelUserVolunteering(
          user: user,
          volunteeringId: volunteeringId,
        );
        return const Right(null);
      } on NotFoundException {
        return const Left(VolunteeringNotFoundFailure());
      } on Exception {
        return const Left(ConnectionFailure());
      }
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, void>> addFavoriteVolunteering({
    required String userId,
    required String volunteeringId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        await volunteeringDataSource.addFavoriteVolunteering(
          userId: userId,
          volunteeringId: volunteeringId,
        );
        return const Right(null);
      } on NotFoundException {
        return const Left(VolunteeringNotFoundFailure());
      } on Exception {
        return const Left(ServerFailure());
      }
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, void>> removeFavoriteVolunteering({
    required String userId,
    required String volunteeringId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        await volunteeringDataSource.removeFavoriteVolunteering(
          userId: userId,
          volunteeringId: volunteeringId,
        );
        return const Right(null);
      } on NotFoundException {
        return const Left(VolunteeringNotFoundFailure());
      } on Exception {
        return const Left(ServerFailure());
      }
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, List<String>>> getFavoriteVolunteerings({
    required String userId,
  }) async {
    if (networkInfo.hasConnection) {
      List<String> favoriteVolunteerings = [];
      try {
        favoriteVolunteerings = await volunteeringDataSource
            .getFavoriteVolunteerings(userId: userId);
      } on Exception {
        return const Left(ServerFailure());
      }

      return Right(favoriteVolunteerings);
    }
    return const Left(ConnectionFailure());
  }
}
