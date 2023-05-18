import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sermanos/config/logger/logger.dart';
import 'package:sermanos/features/core/error/exception.dart';
import 'package:sermanos/features/news/data/entities/remote/remote_news_entity.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<RemoteNewsEntity>> getNews();

  Future<Option<RemoteNewsEntity>> getNewsById({
    required String newsId,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;
  final FirebaseFirestore _firebaseDatabaseClient;

  @override
  Future<List<RemoteNewsEntity>> getNews() async {
    try {
      final response = await _firebaseDatabaseClient.collection("news").get();

      List<RemoteNewsEntity> newsEntities = [];

      for (var news in response.docs) {
        RemoteNewsEntity remoteEntity = RemoteNewsEntity.fromJson(
          newsId: news.id,
          json: news.data(),
        );
        newsEntities.add(remoteEntity);
      }
      return newsEntities;
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }

  @override
  Future<Option<RemoteNewsEntity>> getNewsById({
    required String newsId,
  }) async {
    try {
      final DocumentSnapshot response =
          await _firebaseDatabaseClient.collection("news").doc(newsId).get();

      if (response.exists) {
        logger.d("News with id $newsId does not exist");
        return Option.none();
      }
      RemoteNewsEntity remoteEntity = RemoteNewsEntity.fromJson(
          newsId: response.id,
          json: Map<String, dynamic>.from(
              response.data() as Map<String, Object>));

      return Option.of(remoteEntity);
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }
}
