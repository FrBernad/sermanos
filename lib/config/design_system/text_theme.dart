import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';

TextTheme appTextTheme = const TextTheme(
  displayLarge: SermanosTypography.headline01(),
  displayMedium: SermanosTypography.headline02(),
  titleMedium: SermanosTypography.subtitle01(),
  bodyLarge: SermanosTypography.body01(),
  bodyMedium: SermanosTypography.body02(),
  labelLarge: SermanosTypography.button(),
  bodySmall: SermanosTypography.caption(),
  labelSmall: SermanosTypography.overline(),
);
