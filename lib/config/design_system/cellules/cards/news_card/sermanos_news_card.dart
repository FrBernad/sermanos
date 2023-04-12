import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/cellules/cards/news_card/sermanos_news_card_information.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';
import 'package:sermanos/features/news/domain/models/news.dart';

class SermanosNewsCard extends StatelessWidget {
  const SermanosNewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
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
            ),
            Expanded(
              child: SermanosNewsCardInformation(
                title: news.title,
                subtitle: news.subtitle,
                description: news.description,
              ),
            )
          ],
        ),
      ),
    );
  }
}
