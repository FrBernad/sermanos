import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';

import '../../tokens/sermanos_skeleton.dart';

class SermanosVolunteeringCardLoadingSkeleton extends StatelessWidget {
  const SermanosVolunteeringCardLoadingSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SermanosColors.neutral0,
        borderRadius: BorderRadius.circular(2),
        boxShadow: SermanosShadows.shadow2,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SermanosSkeleton(
            height: 138,
            width: double.infinity,
            rounded: false,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SermanosSkeleton(height: 20, width: 100),
                      SizedBox(height: 4),
                      SermanosSkeleton(height: 25, width: 150),
                      SizedBox(height: 4),
                      SermanosSkeleton(height: 30, width: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
