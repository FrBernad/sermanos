import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/postulate/domain/models/social_action.dart';

import '../../../core/error/failure.dart';

abstract interface class SocialActionsRepository {
  Future<Either<Failure, List<SocialAction>>> getSocialActions();

  Future<Either<Failure, SocialAction>> getSocialActionById({
    required String socialActionId,
  });
}
