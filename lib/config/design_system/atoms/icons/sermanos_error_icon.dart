import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosErrorIcon extends Icon {
  const SermanosErrorIcon.activated({Key? key})
      : super(
          key: key,
          Icons.error,
          size: 24,
          color: SermanosColors.error100,
        );
}
