import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';

import '../../../../../config/logger/logger.dart';
import '../../../../core/error/exception.dart';
import '../../entities/volunteering_entity.dart';

abstract class VolunteeringRemoteDataSource {
  Future<List<VolunteeringEntity>> getVolunteering({
    required String? searchTerm,
  });

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
  Future<List<VolunteeringEntity>> getVolunteering({
    required String? searchTerm,
  }) async {
    try {
      final response =
          await _firebaseDatabaseClient.collection("volunteerings").get();
      List<VolunteeringEntity> volunteeringEntities = [];

      for (var vol in response.docs) {
        VolunteeringEntity volunteeringEntity = VolunteeringEntity.fromJson(
          volunteeringId: vol.id,
          json: vol.data(),
        );
        volunteeringEntities.add(volunteeringEntity);
      }

      if (searchTerm == null || searchTerm.isEmpty) {
        return volunteeringEntities;
      }

      return volunteeringEntities.where((volunteering) {
        final result = extractTop(
          choices: [volunteering.name, volunteering.description],
          query: searchTerm,
          limit: 1,
          cutoff: 70,
        );
        return result.isNotEmpty;
      }).toList();
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
