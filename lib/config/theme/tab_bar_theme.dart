import 'package:flutter/material.dart';
import 'package:sermanos/config/theme/app_colors.dart';
import 'package:sermanos/config/theme/text_theme.dart';

import 'app_text_styles.dart';

TabBarTheme appTabBarTheme = const TabBarTheme(
  indicator: UnderlineTabIndicator(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide.none,
  ),
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: AppColors.neutral25,
  labelColor: AppColors.neutral0,
  labelStyle: AppTextStyles.button,
);
