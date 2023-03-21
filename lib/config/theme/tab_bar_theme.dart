import 'package:flutter/material.dart';
import 'package:sermanos/config/theme/app_colors.dart';

import 'app_text_styles.dart';

TabBarTheme appTabBarTheme = const TabBarTheme(
  indicator: BoxDecoration(
    borderRadius: BorderRadius.zero,
    gradient: LinearGradient(
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
      colors: <Color>[
        AppColors.secondary200,
        AppColors.neutral0,
        AppColors.neutral0,
      ],
      stops: [0.92, 0.92, 1],
    ),
  ),
  labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: AppColors.neutral25,
  labelColor: AppColors.neutral0,
  labelStyle: AppTextStyles.button,
);
