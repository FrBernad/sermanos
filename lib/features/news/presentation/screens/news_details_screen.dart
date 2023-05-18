import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import 'package:sermanos/features/core/presentation/widgets/error_message.dart';
import 'package:sermanos/features/news/application/controllers/get_news_by_id_controller.dart';

class NewsDetailsScreen extends ConsumerWidget {
  static const route = "/news/:id";

  static String routeFromId(String id) => '/news/$id';

  static const routeName = "newsDetail";

  const NewsDetailsScreen({
    Key? key,
    required this.newsId,
  }) : super(key: key);

  final String newsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/sermanos_logo_reactangle.png'),
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final newsByIdController =
              ref.watch(getNewsByIdControllerProvider(newsId: newsId));
          return newsByIdController.when(
            data: (news) {
              return const SermanosCircularProgressIndicator();
            },
            error: (error, stackTrace) => const ErrorMessage(),
            loading: () => const SermanosCircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
