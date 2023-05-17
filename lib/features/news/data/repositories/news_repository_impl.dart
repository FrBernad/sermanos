import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/core/error/failure.dart';
import 'package:sermanos/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:sermanos/features/news/data/entities/remote/remote_news_entity.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  const NewsRepositoryImpl({
    required this.newsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<News>>> getNews() async {
    List<News> news = [];
    try {
      final List<RemoteNewsEntity> newsEntities =
          await newsRemoteDataSource.getNews();

      news = newsEntities.map((n) => n.toModel()).toList();
    } on Exception {
      return const Left(ConnectionFailure());
    }
    return Right(news);
  }

  @override
  Future<Either<Failure, News>> getNewsById({
    required String newsId,
  }) async {
    try {
      final Option<RemoteNewsEntity> newsEntity =
          await newsRemoteDataSource.getNewsById(newsId: newsId);

      if (newsEntity.isNone()) {
        return const Left(NewsNotFoundFailure());
      }
      return Right(newsEntity.toNullable()!.toModel());
    } on Exception {
      return const Left(ConnectionFailure());
    }
  }
// final NetworkInfo networkInfo;
}
