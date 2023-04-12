import 'package:flutter/material.dart';

import 'sermanos_colors.dart';
import 'sermanos_typography.dart';

class SermanosTypography {
  SermanosTypography._();

  static const _headline01 = 24.0;
  static const _headline02 = 20.0;
  static const _subtitle01 = 16.0;
  static const _body01 = 14.0;
  static const _body02 = 12.0;
  static const _button = 14.0;
  static const _caption = 12.0;
  static const _overline = 10.0;

  static const headline01 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _headline01,
    fontWeight: FontWeight.w400,
    color: SermanosColors.neutral100,
  );

  static const headline02 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _headline02,
    fontWeight: FontWeight.w500,
    color: SermanosColors.neutral100,
  );

  static const subtitle01 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _subtitle01,
    fontWeight: FontWeight.w400,
    color: SermanosColors.neutral100,
  );

  static const body01 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _body01,
    fontWeight: FontWeight.w400,
    color: SermanosColors.neutral100,
  );

  static const body02 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _body02,
    fontWeight: FontWeight.w400,
    color: SermanosColors.neutral100,
  );

  static const button = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _button,
    fontWeight: FontWeight.w500,
    color: SermanosColors.neutral100,
  );

  static const caption = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _caption,
    fontWeight: FontWeight.w400,
    color: SermanosColors.neutral100,
  );

  static const overline = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _overline,
    fontWeight: FontWeight.w500,
    color: SermanosColors.neutral100,
  );
}
