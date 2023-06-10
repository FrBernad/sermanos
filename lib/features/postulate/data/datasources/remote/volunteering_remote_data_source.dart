import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../config/logger/logger.dart';
import '../../../../core/error/exception.dart';
import '../../entities/volunteering_entity.dart';

abstract class VolunteeringRemoteDataSource {
  Future<List<VolunteeringEntity>> getVolunteering();

  Future<Option<VolunteeringEntity>> getVolunteeringById({
    required String volunteeringId,
  });
}

class VolunteeringRemoteDataSourceImpl implements VolunteeringRemoteDataSource {
  VolunteeringRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;

  final FirebaseFirestore _firebaseDatabaseClient;

  @override
  Future<List<VolunteeringEntity>> getVolunteering() async {
    try {
      final QuerySnapshot response =
          await _firebaseDatabaseClient.collection("volunteerings").get();
      List<VolunteeringEntity> volunteeringEntities = [];

      for (var d in response.docs) {
        VolunteeringEntity volunteeringEntity = VolunteeringEntity.fromJson(
            volunteeringId: d.id,
            json: Map<String, dynamic>.from(d.data() as Map<String, dynamic>));
        volunteeringEntities.add(volunteeringEntity);
      }

      return volunteeringEntities;
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<Option<VolunteeringEntity>> getVolunteeringById({
    required String volunteeringId,
  }) async {
    try {
      final DocumentSnapshot response = await _firebaseDatabaseClient
          .collection("volunteerings")
          .doc(volunteeringId)
          .get();

      if (!response.exists) {
        logger.d("Volunteering with id $volunteeringId does not exist");
        return const Option.none();
      }

      VolunteeringEntity volunteeringEntity = VolunteeringEntity.fromJson(
        volunteeringId: response.id,
        json:
            Map<String, dynamic>.from(response.data() as Map<String, dynamic>),
      );

      return Option.of(volunteeringEntity);
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }
}
