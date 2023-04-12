import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosAddIcon extends Icon {
  const SermanosAddIcon.enabled({Key? key})
      : super(
          key: key,
          Icons.add,
          color: SermanosColors.neutral0,
          size: 24,
        );
}
