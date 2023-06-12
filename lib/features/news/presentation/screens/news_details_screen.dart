import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/molecules/spinner/ser_manos_circular_progress_indicator.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';
import 'package:sermanos/features/core/presentation/widgets/error_message.dart';
import 'package:sermanos/features/news/application/controllers/get_news_by_id_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config/design_system/tokens/sermanos_typography.dart';

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
    final newsByIdController =
        ref.watch(getNewsByIdControllerProvider(newsId: newsId));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Novedades",
          style: SermanosTypography.subtitle01(color: SermanosColors.neutral0),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: SermanosColors.neutral0,
        ),
      ),
      body: newsByIdController.when(
        data: (news) {
          return SermanosGrid(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    news.source.toUpperCase(),
                    style: const SermanosTypography.overline(
                      color: SermanosColors.neutral75,
                    ),
                  ),
                  Text(
                    news.title,
                    style: const SermanosTypography.headline02(
                      color: SermanosColors.neutral100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CachedNetworkImage(
                    imageUrl: news.imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    news.subtitle,
                    style: const SermanosTypography.subtitle01(
                      color: SermanosColors.secondary200,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    news.content,
                    style: const SermanosTypography.body01(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Comparte esta nota",
                    style: SermanosTypography.headline01(),
                  ),
                  const SizedBox(height: 16),
                  SermanosCTAButton(
                    text: "Compartir",
                    onPressed: () async => await Share.share(news.title),
                    filled: true,
                  )
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => const ErrorMessage(),
        loading: () => const SermanosCircularProgressIndicator(),
      ),
    );
  }
}
