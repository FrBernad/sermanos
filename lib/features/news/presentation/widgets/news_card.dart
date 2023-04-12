import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/features/news/domain/models/news.dart';
import 'package:sermanos/features/news/presentation/widgets/information.dart';

import '../../../../config/design_system/tokens/ds_colors.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 24.0,
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.30),
              offset: const Offset(0, 1), // changes position of shadow
              blurRadius: 3,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 2), // changes position of shadow
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ]),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Information(
                    title: news.title,
                    subtitle: news.subtitle,
                    description: news.description,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        child: Text(
                          'Leer Más',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: DesignSystemColors.primary100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
