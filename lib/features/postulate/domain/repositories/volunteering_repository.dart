import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/postulate/domain/models/postulation.dart';
import 'package:sermanos/features/postulate/domain/models/postulation_status.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';

import '../../../core/error/failure.dart';

abstract interface class VolunteeringRepository {
  //Retorna todos los voluntariados
  Future<Either<Failure, List<Volunteering>>> getVolunteerings({
    required String? searchTerm,
  });

  //Retorna el voluntariado con id volunteeringId
  Future<Either<Failure, Volunteering>> getVolunteeringById({
    required String volunteeringId,
  });

  // //Retorna el voluntariado al que el usuario se suscribió o del que participa.
  // Future<Either<Failure, Postulation>>
  //     getCurrentSubscribedVolunteeringByUserId({
  //   required String userId,
  // });
  //
  // //Retorna el estado de postulation para el  voluntariado con id volunteeringId
  // Future<Either<Failure, PostulationStatus>>
  //     getPostulationStatusByVolunteeringId({
  //   required AppUser user,
  //   required String volunteeringId,
  // });

  Future<Either<Failure, void>> subscribeToVolunteering({
    required AppUser user,
    required String volunteeringId,
  });

  // Future<Either<Failure, void>> unsubscribeFromVolunteeringByVolunteeringId({
  //   required AppUser user,
  //   required String volunteeringId,
  // });
}
