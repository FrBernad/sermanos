import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/cellules/cards/news_card/sermanos_news_card.dart';
import 'package:sermanos/config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
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

    return newsController.when(
      data: (news) {
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            SermanosGrid.horizontalSpacing,
            32,
            SermanosGrid.horizontalSpacing,
            32,
          ),
          itemCount: news.length,
          itemBuilder: (context, index) {
            return SermanosNewsCard(
              news: news[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 24),
        );
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }
}
