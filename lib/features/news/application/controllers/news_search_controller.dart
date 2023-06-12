import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/providers.dart';

part 'generated/news_search_controller.g.dart';

@riverpod
Future<List<News>> newsSearchController(NewsSearchControllerRef ref) async {
  final newsRepository = ref.read(newsRepositoryProvider);

  final newsEither = await newsRepository.getNews();

  return newsEither.fold((l) => throw Exception(l.message), (r) => r);
}
