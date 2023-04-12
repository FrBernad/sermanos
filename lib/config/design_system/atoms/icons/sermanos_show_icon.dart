import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosShowIcon extends Icon {
  const SermanosShowIcon.enabled({Key? key, hide = false})
      : super(
          key: key,
          hide ? Icons.visibility : Icons.visibility_off,
          size: 24,
          color: SermanosColors.neutral75,
        );
}
