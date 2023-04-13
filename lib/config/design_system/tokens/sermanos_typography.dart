import 'package:flutter/material.dart';

import 'sermanos_colors.dart';

class SermanosTypography extends TextStyle {
  const SermanosTypography({
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
  }) : super(
          fontFamily: 'Roboto',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );

  static const _headline01 = 24.0;
  static const _headline02 = 20.0;
  static const _subtitle01 = 16.0;
  static const _body01 = 14.0;
  static const _body02 = 12.0;
  static const _button = 14.0;
  static const _caption = 12.0;
  static const _overline = 10.0;

  const SermanosTypography.headline01({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _headline01,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const SermanosTypography.headline02({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _headline02,
          fontWeight: FontWeight.w500,
          color: color,
        );

  const SermanosTypography.subtitle01({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _subtitle01,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const SermanosTypography.body01({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _body01,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const SermanosTypography.body02({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _body02,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const SermanosTypography.button({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _button,
          fontWeight: FontWeight.w500,
          color: color,
        );

  const SermanosTypography.caption({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _caption,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const SermanosTypography.overline({
    Color color = SermanosColors.neutral100,
  }) : this(
          fontSize: _overline,
          fontWeight: FontWeight.w500,
          color: color,
        );
}
