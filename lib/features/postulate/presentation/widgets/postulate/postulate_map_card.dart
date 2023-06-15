import 'package:flutter/cupertino.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulate_details/postulate_details_map.dart';

import '../../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../../config/design_system/tokens/sermanos_typography.dart';

class PostulateMapCard extends StatelessWidget {
  const PostulateMapCard({super.key, required this.volunteering});

  final Volunteering volunteering;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                topLeft: Radius.circular(4),
              ),
              color: SermanosColors.secondary25,
            ),
            width: double.infinity,
            child: const Text(
              "Ubicación",
              style: SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100),
            ),
          ),
          SizedBox(
            height: 155,
            child: PostulateDetailsMap(
              volunteering: volunteering,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4)),
              color: SermanosColors.neutral10,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DIRECCIÓN",
                  style: SermanosTypography.overline(
                    color: SermanosColors.neutral75,
                  ),
                ),
                Text(
                  volunteering.address,
                  style: const SermanosTypography.body01(
                    color: SermanosColors.neutral100,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
