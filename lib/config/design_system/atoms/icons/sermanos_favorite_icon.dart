import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosFavoriteIcon extends Icon {
  const SermanosFavoriteIcon.enabled({Key? key})
      : super(
          key: key,
          Icons.favorite_outline,
          color: SermanosColors.primary100,
          size: 24,
        );
}
