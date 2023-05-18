import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/core/error/failure.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/providers.dart';

part 'generated/news_search_controller.g.dart';

@riverpod
class NewsSearchController extends _$NewsSearchController {
  @override
  Future<List<News>> build() async {
    final newsEither = await _getNews();

    return newsEither.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  Future<Either<Failure, List<News>>> _getNews() async {
    final newsRepository = ref.read(newsRepositoryProvider);

    final newsEither = await newsRepository.getNews();

    return newsEither;
  }
}
