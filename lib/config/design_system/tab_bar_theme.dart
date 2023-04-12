import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/ds_colors.dart';
import 'package:sermanos/config/design_system/tokens/ds_colors.dart';

import 'tokens/ds_typography.dart';

TabBarTheme appTabBarTheme = const TabBarTheme(
  indicator: BoxDecoration(
    borderRadius: BorderRadius.zero,
    gradient: LinearGradient(
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
      colors: <Color>[
        DesignSystemColors.secondary200,
        DesignSystemColors.neutral0,
        DesignSystemColors.neutral0,
      ],
      stops: [0.92, 0.92, 1],
    ),
  ),
  labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: DesignSystemColors.neutral25,
  labelColor: DesignSystemColors.neutral0,
  labelStyle: DesignSystemTypography.button,
);
