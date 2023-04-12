import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosBackIcon extends Icon {
  const SermanosBackIcon.enabled({Key? key})
      : super(
          key: key,
          size: 24,
          Icons.arrow_back,
          color: SermanosColors.neutral0,
        );
}
