import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/cellules/cards/news_card/sermanos_news_card.dart';
import 'package:sermanos/config/design_system/cellules/cards/news_card/sermanos_news_card_loading_skeleton.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';
import 'package:sermanos/features/core/presentation/widgets/error_message.dart';

import '../../application/controllers/news_search_controller.dart';

class NewsScreen extends ConsumerWidget {
  static const route = "/news";
  static const routeName = "news";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsController = ref.watch(newsSearchControllerProvider);

    const listPadding = EdgeInsets.fromLTRB(
      SermanosGrid.horizontalSpacing,
      32,
      SermanosGrid.horizontalSpacing,
      32,
    );

    return newsController.when(
      data: (news) => ListView.separated(
        padding: listPadding,
        itemCount: news.length,
        itemBuilder: (context, index) {
          return SermanosNewsCard(
            news: news[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 24),
      ),
      loading: () => ListView.separated(
        padding: listPadding,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const SermanosNewsCardLoadingSkeleton();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 24),
      ),
      error: (error, stackTrace) => const ErrorMessage(),
    );
  }
}
