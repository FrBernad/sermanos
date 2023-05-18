import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/providers.dart';

part 'generated/get_news_by_id_controller.g.dart';

@riverpod
Future<News> getNewsByIdController(
  GetNewsByIdControllerRef ref, {
  required String newsId,
}) async {
  final newsEither =
      await ref.read(newsRepositoryProvider).getNewsById(newsId: newsId);

  return newsEither.fold((l) => throw Exception(l.message), (r) => r);
}
