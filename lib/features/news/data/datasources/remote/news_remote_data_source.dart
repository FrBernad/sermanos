import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sermanos/config/logger/logger.dart';
import 'package:sermanos/features/core/error/exception.dart';
import 'package:sermanos/features/news/data/entities/news_entity.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<NewsEntity>> getNews();

  Future<Option<NewsEntity>> getNewsById({
    required String newsId,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl({
    required firebaseDatabaseClient,
  }) : _firebaseDatabaseClient = firebaseDatabaseClient;
  final FirebaseFirestore _firebaseDatabaseClient;

  @override
  Future<List<NewsEntity>> getNews() async {
    try {
      final response = await _firebaseDatabaseClient.collection("news").get();

      List<NewsEntity> newsEntities = [];

      for (var news in response.docs) {
        NewsEntity remoteEntity = NewsEntity.fromJson(
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
  Future<Option<NewsEntity>> getNewsById({
    required String newsId,
  }) async {
    try {
      final DocumentSnapshot response =
          await _firebaseDatabaseClient.collection("news").doc(newsId).get();

      if (!response.exists) {
        logger.d("News with id $newsId does not exist");
        return const Option.none();
      }
      NewsEntity remoteEntity = NewsEntity.fromJson(
          newsId: response.id,
          json: Map<String, dynamic>.from(
              response.data() as Map<String, dynamic>));

      return Option.of(remoteEntity);
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }
}
