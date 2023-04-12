import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosCloseIcon extends Icon {
  const SermanosCloseIcon.enabled({Key? key})
      : super(
          key: key,
          Icons.close,
          size: 24,
          color: SermanosColors.neutral75,
        );
}
