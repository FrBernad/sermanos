import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_reduced_entity.dart';
import 'package:sermanos/features/postulate/domain/models/postulation_status.dart';
import 'package:sermanos/features/user/data/entities/app_user_entity.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';

import '../../../../../config/logger/logger.dart';
import '../../../../core/error/exception.dart';
import '../../entities/volunteering_entity.dart';

abstract class VolunteeringRemoteDataSource {
  Future<List<VolunteeringEntity>> getVolunteerings({
    required String? searchTerm,
  });

  Future<Option<VolunteeringEntity>> getVolunteeringById({
    required String volunteeringId,
  });

  Future<Option<VolunteeringReducedEntity>> getUserVolunteering({
    required String userId,
  });

  Future<void> postulateUserToVolunteering({
    required AppUser user,
    required String volunteeringId,
  });

  Future<void> cancelUserVolunteeringPostulation({
    required AppUser user,
    required String volunteeringId,
  });

  Future<void> addFavoriteVolunteering({
    required String userId,
    required String volunteeringId,
  });

  Future<void> removeFavoriteVolunteering({
    required String userId,
    required String volunteeringId,
  });

  Future<List<String>> getFavoriteVolunteerings({
    required String userId,
  });
}

class VolunteeringRemoteDataSourceImpl implements VolunteeringRemoteDataSource {
  VolunteeringRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;

  final FirebaseFirestore _firebaseDatabaseClient;

  @override
  Future<List<VolunteeringEntity>> getVolunteerings({
    required String? searchTerm,
  }) async {
    try {
      final response = await _firebaseDatabaseClient
          .collection(VolunteeringEntity.collectionName)
          .get();

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
      final response = await _firebaseDatabaseClient
          .collection("volunteerings")
          .doc(volunteeringId)
          .get();

      if (!response.exists) {
        logger.d("Volunteering with id $volunteeringId does not exist");
        return const Option.none();
      }

      VolunteeringEntity volunteeringEntity = VolunteeringEntity.fromJson(
        volunteeringId: response.id,
        json: response.data()!,
      );

      return Option.of(volunteeringEntity);
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<Option<VolunteeringReducedEntity>> getUserVolunteering({
    required String userId,
  }) async {
    try {
      final volunteerings = await _firebaseDatabaseClient
          .collection(AppUserEntity.collectionName)
          .doc(userId)
          .collection(VolunteeringReducedEntity.collectionName)
          .get();

      final currentVolunteering = volunteerings.docs.firstOrNull;

      if (currentVolunteering == null) {
        return const Option.none();
      }

      VolunteeringReducedEntity volunteeringEntity =
          VolunteeringReducedEntity.fromJson(
        volunteeringId: currentVolunteering.id,
        json: currentVolunteering.data(),
      );

      return Option.of(volunteeringEntity);
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<void> postulateUserToVolunteering({
    required AppUser user,
    required String volunteeringId,
  }) async {
    try {
      Option<VolunteeringEntity> volunteeringOpt =
          await getVolunteeringById(volunteeringId: volunteeringId);

      if (volunteeringOpt.isNone()) {
        throw NotFoundException();
      }

      final VolunteeringEntity v = volunteeringOpt.toNullable()!;

      if (v.volunteersQty < v.capacity) {
        final volunteeringPostulationQuery = _firebaseDatabaseClient
            .collection(VolunteeringEntity.collectionName)
            .doc(volunteeringId)
            .collection("postulations")
            .doc(user.id);

        await volunteeringPostulationQuery.set({
          'name': user.name,
          'surname': user.surname,
        });

        final userPostulationQuery = _firebaseDatabaseClient
            .collection(AppUserEntity.collectionName)
            .doc(user.id)
            .collection(VolunteeringEntity.collectionName)
            .doc(volunteeringId);

        await userPostulationQuery.set({
          'name': v.name,
          'description': v.description,
          'category': v.category,
          'lat': v.lat,
          'lng': v.lng,
          'status': PostulationStatus.pending.name
        });
      } else {
        throw NoVacancyAtVolunteeringException();
      }
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<void> cancelUserVolunteeringPostulation({
    required AppUser user,
    required String volunteeringId,
  }) async {
    try {
      final volunteeringPostulationQuery = _firebaseDatabaseClient
          .collection(VolunteeringEntity.collectionName)
          .doc(volunteeringId)
          .collection("postulations")
          .doc(user.id);

      await volunteeringPostulationQuery.delete();

      final userPostulationQuery = _firebaseDatabaseClient
          .collection(AppUserEntity.collectionName)
          .doc(user.id)
          .collection(VolunteeringEntity.collectionName)
          .doc(volunteeringId);

      await userPostulationQuery.delete();
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<void> addFavoriteVolunteering(
      {required String userId, required String volunteeringId}) async {
    try {
      final userFavoriteVolunteeringQuery = _firebaseDatabaseClient
          .collection(AppUserEntity.collectionName)
          .doc(userId)
          .collection("favoriteVolunteerings")
          .doc("favoriteVolunteerings");

      if (!(await userFavoriteVolunteeringQuery.get()).exists) {
        await userFavoriteVolunteeringQuery.set({
          'favorites': [],
        });
      }

      await userFavoriteVolunteeringQuery.update({
        'favorites': FieldValue.arrayUnion(
          [volunteeringId],
        )
      });
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<void> removeFavoriteVolunteering(
      {required String userId, required String volunteeringId}) async {
    try {
      final userFavoriteVolunteeringQuery = _firebaseDatabaseClient
          .collection(AppUserEntity.collectionName)
          .doc(userId)
          .collection("favoriteVolunteerings")
          .doc("favoriteVolunteerings");

      await userFavoriteVolunteeringQuery.update({
        'favorites': FieldValue.arrayRemove(
          [volunteeringId],
        )
      });
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getFavoriteVolunteerings({
    required String userId,
  }) async {
    try {
      final DocumentSnapshot response = await _firebaseDatabaseClient
          .collection(AppUserEntity.collectionName)
          .doc(userId)
          .collection("favoriteVolunteerings")
          .doc("favoriteVolunteerings")
          .get();

      if (!response.exists) {
        return [];
      }

      final json =
          Map<String, dynamic>.from(response.data() as Map<String, dynamic>);

      final favorites = json['favorites'] as List<String>;

      return favorites;
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }
}
