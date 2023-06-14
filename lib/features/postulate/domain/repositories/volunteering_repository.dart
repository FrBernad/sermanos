import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';

import '../../../core/error/failure.dart';
import '../models/volunteering_reduced.dart';

abstract interface class VolunteeringRepository {
  Future<Either<Failure, List<Volunteering>>> getVolunteerings({
    required String? searchTerm,
  });

  Future<Either<Failure, Volunteering>> getVolunteeringById({
    required String volunteeringId,
  });

  Future<Either<Failure, Option<VolunteeringReduced>>> getUserVolunteering({
    required String userId,
  });

  Future<Either<Failure, void>> postulateUserToVolunteering({
    required AppUser user,
    required String volunteeringId,
  });

  Future<Either<Failure, void>> cancelUserVolunteeringPostulation({
    required AppUser user,
    required String volunteeringId,
  });
}
