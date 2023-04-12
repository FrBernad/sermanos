import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosLocationIcon extends Icon {
  const SermanosLocationIcon.enabled({Key? key})
      : super(
          key: key,
          Icons.location_on,
          color: SermanosColors.primary100,
          size: 24,
        );
}
