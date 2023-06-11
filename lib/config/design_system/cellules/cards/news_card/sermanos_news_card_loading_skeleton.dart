import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_shadows.dart';

import '../../../tokens/sermanos_skeleton.dart';

class SermanosNewsCardLoadingSkeleton extends StatelessWidget {
  const SermanosNewsCardLoadingSkeleton({
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
      child: const IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SermanosSkeleton(
              width: 118,
              rounded: false,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SermanosSkeleton(height: 18, width: 100),
                        SizedBox(height: 4),
                        SermanosSkeleton(height: 22, width: 150),
                        SizedBox(height: 4),
                        SermanosSkeleton(height: 16),
                        SizedBox(height: 2),
                        SermanosSkeleton(height: 16),
                        SizedBox(height: 2),
                        SermanosSkeleton(height: 16),
                        SizedBox(height: 2),
                        SermanosSkeleton(height: 16, width: 100),
                        SizedBox(height: 2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SermanosSkeleton(height: 30, width: 80),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
