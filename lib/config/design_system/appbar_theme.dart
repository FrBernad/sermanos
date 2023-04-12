import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

AppBarTheme appBarTheme = const AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: SermanosColors.secondary90,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ),
  backgroundColor: SermanosColors.secondary90,
);
