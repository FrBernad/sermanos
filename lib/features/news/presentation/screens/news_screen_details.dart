import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import 'package:sermanos/features/core/presentation/widgets/error_message.dart';
import 'package:sermanos/features/news/application/news_search_controller.dart';

class NewsScreenDetails extends ConsumerWidget {
  static const route = "/news/:newsId";
  static const routeName = "newsDetails";

  const NewsScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsController = ref.watch(newsSearchControllerProvider);

    return newsController.when(
      data: (news) {
        return const SermanosCircularProgressIndicator();
      },
      error: (error, stackTrace) => const ErrorMessage(),
      loading: () => const SermanosCircularProgressIndicator(),
    );
  }
}
