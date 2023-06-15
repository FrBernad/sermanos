import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

import '../../../../../features/news/domain/models/news.dart';
import '../../../../../features/news/presentation/screens/news_details_screen.dart';

class SermanosNewsCardInformation extends StatelessWidget {
  const SermanosNewsCardInformation({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.source.toUpperCase(),
                style: const SermanosTypography.overline(
                  color: SermanosColors.neutral75,
                ),
              ),
              Text(
                news.title,
                style: const SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100,
                ),
              ),
              Text(
                news.subtitle,
                style: const SermanosTypography.body02(
                  color: SermanosColors.neutral75,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SermanosShortButton(
                loading: false,
                filled: false,
                onPressed: () => context.beamToNamed(
                  NewsDetailsScreen.routeFromId(news.id),
                ),
                text: "Leer Más",
                textColor: SermanosColors.primary100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
