import 'package:flutter/material.dart';
import 'package:ser_manos/config/theme/app_typography.dart';

TextTheme appTextTheme = const TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.headline01,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.headline02,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.subtitle01,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.body01,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.body02,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.button,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.caption,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: AppTypography.overline,
  ),
);
