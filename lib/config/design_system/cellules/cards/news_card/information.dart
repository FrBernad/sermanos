import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

class Information extends StatelessWidget {
  const Information(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description});

  final String title;
  final String subtitle;
  final String description;

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
                subtitle.toUpperCase(),
                style: SermanosTypography.overline.copyWith(
                  color: SermanosColors.neutral75,
                ),
              ),
              Text(
                title,
                style: SermanosTypography.subtitle01.copyWith(
                  color: SermanosColors.neutral100,
                ),
              ),
              Text(
                description,
                style: SermanosTypography.body02.copyWith(
                  color: SermanosColors.neutral75,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SermanosCTAButton(
              filled: false,
              onPressed: () => null,
              text: "Leer Más",
            ),
          ),
        ],
      ),
    );
  }
}
