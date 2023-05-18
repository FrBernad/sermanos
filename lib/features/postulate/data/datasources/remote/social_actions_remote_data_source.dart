import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../config/logger/logger.dart';
import '../../../../core/error/exception.dart';
import '../../entities/remote/remote_social_action_entity.dart';

abstract class SocialActionsRemoteDataSource {
  Future<List<RemoteSocialActionEntity>> getSocialActions();

  Future<Option<RemoteSocialActionEntity>> getSocialActionById({
    required String socialActionId,
  });
}

class SocialActionsRemoteDataSourceImpl
    implements SocialActionsRemoteDataSource {
  SocialActionsRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;

  final FirebaseFirestore _firebaseDatabaseClient;

  @override
  Future<List<RemoteSocialActionEntity>> getSocialActions() async {
    try {
      final QuerySnapshot response =
          await _firebaseDatabaseClient.collection("volunteerings").get();
      List<RemoteSocialActionEntity> socialActionEntities = [];

      for (var d in response.docs) {
        RemoteSocialActionEntity socialActionEntity =
            RemoteSocialActionEntity.fromJson(
                socialActionId: d.id,
                json: Map<String, dynamic>.from(
                    d.data() as Map<String, dynamic>));
        socialActionEntities.add(socialActionEntity);
      }

      return socialActionEntities;
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<Option<RemoteSocialActionEntity>> getSocialActionById({
    required String socialActionId,
  }) async {
    try {
      final DocumentSnapshot response = await _firebaseDatabaseClient
          .collection("volunteerings")
          .doc(socialActionId)
          .get();

      if (!response.exists) {
        logger.d("Social action with id $socialActionId does not exist");
        return const Option.none();
      }

      RemoteSocialActionEntity socialActionEntity =
          RemoteSocialActionEntity.fromJson(
        socialActionId: response.id,
        json:
            Map<String, dynamic>.from(response.data() as Map<String, dynamic>),
      );

      return Option.of(socialActionEntity);
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }
}
