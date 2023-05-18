import 'package:fpdart/fpdart.dart';
import 'package:sermanos/features/core/error/failure.dart';
import 'package:sermanos/features/news/domain/models/news.dart';

abstract interface class NewsRepository {
  Future<Either<Failure, List<News>>> getNews();

  Future<Either<Failure, News>> getNewsById({
    required String newsId,
  });
}
