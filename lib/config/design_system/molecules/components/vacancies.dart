import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/atoms/icons/sermanos_icons.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

class Vacancies extends StatelessWidget {
  const Vacancies({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  final int vacancy;

  //FIXME: en el figma aparece este color #CAE5FB, pero no está definido en los tokens.
  @override
  Widget build(BuildContext context) {
    final hasVacancy = vacancy > 0;

    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: hasVacancy
              ? SermanosColors.secondary25
              : SermanosColors.neutral25),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Vacantes:",
            style: SermanosTypography.body02(
              color: SermanosColors.neutral100,
            ),
          ),
          const SizedBox(
            width: 11.33,
          ),
          SermanosIcons.people(
            status: hasVacancy
                ? SermanosIconStatus.activatedSecondary
                : SermanosIconStatus.disabledSecondary,
          ),
          Text(
            vacancy.toString(),
            style: SermanosTypography.subtitle01(
              color: hasVacancy
                  ? SermanosColors.secondary200
                  : SermanosColors.secondary80,
            ),
          )
        ],
      ),
    );
  }
}
