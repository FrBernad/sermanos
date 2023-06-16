import 'package:fpdart/fpdart.dart';
import 'package:sermanos/config/providers.dart';
import 'package:sermanos/features/core/error/failure.dart';
import 'package:sermanos/features/core/platform/network_info.dart';
import 'package:sermanos/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:sermanos/features/news/data/entities/news_entity.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  const NewsRepositoryImpl({
    required this.newsRemoteDataSource,
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<News>>> getNews() async {
    List<News> news = [];
    if (networkInfo.hasConnection) {
      try {
        final List<NewsEntity> newsEntities =
            await newsRemoteDataSource.getNews();

        news = newsEntities.map((n) => n.toModel()).toList();
      } on Exception {
        return const Left(ServerFailure());
      }
      return Right(news);
    }
    return const Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, News>> getNewsById({
    required String newsId,
  }) async {
    if (networkInfo.hasConnection) {
      try {
        final Option<NewsEntity> newsEntity =
            await newsRemoteDataSource.getNewsById(newsId: newsId);

        if (newsEntity.isNone()) {
          return const Left(NewsNotFoundFailure());
        }

        return Right(newsEntity.toNullable()!.toModel());
      } on Exception {
        return const Left(ServerFailure());
      }
    }
    return const Left(ConnectionFailure());
  }
}
