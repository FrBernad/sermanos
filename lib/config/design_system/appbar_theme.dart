import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sermanos/config/design_system/tokens/ds_colors.dart';

AppBarTheme appBarTheme = const AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: DesignSystemColors.secondary90,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ),
  backgroundColor: DesignSystemColors.secondary90,
  // surfaceTintColor: AppColors.navGlass,
  // backgroundColor: AppColors.navGlass,
  // elevation: 1.5,
  // shadowColor: Color.fromRGBO(0, 0, 0, 0.4),
  // centerTitle: true,
);
