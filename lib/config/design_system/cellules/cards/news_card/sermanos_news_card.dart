import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/cellules/cards/news_card/sermanos_news_card_information.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/presentation/screens/news_details_screen.dart';

import '../../../../providers.dart';
import '../../../tokens/sermanos_skeleton.dart';

class SermanosNewsCard extends ConsumerWidget {
  const SermanosNewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow2,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: news.imageUrl,
                width: 118,
                fit: BoxFit.cover,
                errorWidget: (BuildContext context, String s, dynamic) {
                  return Image.asset(
                      "assets/images/sermanos_image_not_found.png");
                },
                placeholder: (BuildContext context, String url) {
                  return const SermanosSkeleton(rounded: false);
                },
              ),
              Expanded(
                child: SermanosNewsCardInformation(
                  news: news,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () async {
        await ref.read(firebaseAnalyticsProvider).logSelectContent(
              contentType: 'News',
              itemId: news.id,
            );
        if (context.mounted) {
          context.beamToNamed(NewsDetailsScreen.routeFromId(news.id));
        }
      },
    );
  }
}
