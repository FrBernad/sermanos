import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

import '../../../core/error/failure.dart';

abstract interface class VolunteeringRepository {
  Future<Either<Failure, List<Volunteering>>> getVolunteering({
    required String? searchTerm,
  });

  Future<Either<Failure, Volunteering>> getVolunteeringById({
    required String volunteeringId,
  });
}
