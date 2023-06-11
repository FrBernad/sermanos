import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

import 'tokens/sermanos_typography.dart';

TabBarTheme appTabBarTheme = const TabBarTheme(
  indicator: BoxDecoration(
    borderRadius: BorderRadius.zero,
    gradient: LinearGradient(
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
      colors: <Color>[
        SermanosColors.secondary200,
        SermanosColors.neutral0,
        SermanosColors.neutral0,
      ],
      stops: [0.94, 0.94, 1],
    ),
  ),
  labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: SermanosColors.neutral25,
  labelColor: SermanosColors.neutral0,
  labelStyle: SermanosTypography.button(),
);
