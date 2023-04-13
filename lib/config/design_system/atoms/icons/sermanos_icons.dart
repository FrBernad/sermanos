import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';
import '../../tokens/sermanos_colors.dart';

class SermanosIcons extends Icon {
  SermanosIcons({
    Key? key,
    required IconData icon,
    required SermanosIconStatus status,
  }) : super(
          key: key,
          icon,
          color: status.color,
          size: 24,
        );

  SermanosIcons.add({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.add,
          status: status,
        );

  SermanosIcons.back({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.arrow_back,
          status: status,
        );

  SermanosIcons.close({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.close,
          status: status,
        );

  SermanosIcons.error({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.error,
          status: status,
        );

  SermanosIcons.favorite({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.favorite_outline,
          status: status,
        );

  SermanosIcons.location({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.location_on,
          status: status,
        );

  SermanosIcons.search({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.search,
          status: status,
        );

  SermanosIcons.show({
    Key? key,
    required SermanosIconStatus status,
    hide = false,
  }) : this(
          key: key,
          icon: hide ? Icons.visibility : Icons.visibility_off,
          status: status,
        );
}

enum SermanosIconStatus {
  enabled(SermanosColors.neutral75),
  disabled(SermanosColors.neutral25),
  activated(SermanosColors.primary100),
  error(SermanosColors.error100),
  //FIXME: como arreglo esto?
  back(SermanosColors.neutral0);

  final Color color;

  const SermanosIconStatus(this.color);
}
