import 'package:flutter/cupertino.dart';

class SermanosGrid extends Padding {
  const SermanosGrid({Key? key, required Widget child})
      : super(
          key: key,
          padding: const EdgeInsets.symmetric(horizontal: horizontalSpacing),
          child: child,
        );

  static const double horizontalSpacing = 16;
  static const double verticalSpacing = 16;
}
