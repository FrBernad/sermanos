import 'package:flutter/material.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_grid.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';

class NoVolunteeringAvailable extends StatelessWidget {
  const NoVolunteeringAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SermanosGrid(
        child: Container(
          height: 108,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: SermanosColors.neutral0,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 24,
          ),
          child: const Center(
            child: Text(
              "Actualmente no hay voluntariados vigentes. Pronto se irán ircorporando nuevos",
              textAlign: TextAlign.center,
              style: SermanosTypography.subtitle01(
                color: SermanosColors.neutral100,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
