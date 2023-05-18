import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/postulate/data/entities/remote/remote_social_action_entity.dart';
import 'package:sermanos/features/postulate/domain/models/social_action.dart';

import '../../../core/error/failure.dart';
import '../../domain/repositories/social_actions_repository.dart';
import '../datasources/remote/social_actions_remote_data_source.dart';

class SocialActionsRepositoryImpl implements SocialActionsRepository {
  SocialActionsRepositoryImpl({
    required this.socialActionsDataSource,
  });

  final SocialActionsRemoteDataSource socialActionsDataSource;

  @override
  Future<Either<Failure, List<SocialAction>>> getSocialActions() async {
    List<SocialAction> socialActions = [];
    try {
      final List<RemoteSocialActionEntity> socialActionsEntities =
          await socialActionsDataSource.getSocialActions();

      socialActions = socialActionsEntities.map((n) => n.toModel()).toList();
    } on Exception {
      return const Left(ConnectionFailure());
    }

    return Right(socialActions);
  }

  @override
  Future<Either<Failure, SocialAction>> getSocialActionById({
    required String socialActionId,
  }) async {
    try {
      final Option<RemoteSocialActionEntity> socialActionEntity =
          await socialActionsDataSource.getSocialActionById(
        socialActionId: socialActionId,
      );

      if (socialActionEntity.isNone()) {
        return const Left(SocialActionNotFoundFailure());
      }
      return Right(socialActionEntity.toNullable()!.toModel());
    } on Exception {
      return const Left(ConnectionFailure());
    }
  }
}
