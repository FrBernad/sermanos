import 'package:sermanos/features/news/application/controllers/news_search_controller.dart';
import 'package:sermanos/features/news/domain/models/news.dart';

import 'mocks/news_mock_list.dart';

Future<List<News>> newsSearchControllerMock(NewsSearchControllerRef ref) async {
  return newsListMock;
}
