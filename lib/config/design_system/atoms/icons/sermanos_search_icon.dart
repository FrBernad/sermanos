import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosSearchIcon extends Icon {
  const SermanosSearchIcon.enabled({Key? key})
      : super(
          key: key,
          Icons.search,
          size: 24,
          color: SermanosColors.neutral75,
        );
}
