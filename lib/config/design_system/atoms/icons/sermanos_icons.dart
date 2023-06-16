import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosIcons extends Icon {
  SermanosIcons({
    Key? key,
    required IconData icon,
    required SermanosIconStatus status,
    double size = 24,
  }) : super(
          key: key,
          icon,
          color: status.color,
          size: size,
        );

  /// Near Me Icon
  SermanosIcons.nearMeFilled({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.near_me,
          status: status,
        );

  /// Show Icon
  SermanosIcons.showFilled({
    Key? key,
    required SermanosIconStatus status,
    hide = false,
  }) : this(
          key: key,
          icon: hide ? Icons.visibility : Icons.visibility_off,
          status: status,
        );

  SermanosIcons.showOutlined({
    Key? key,
    required SermanosIconStatus status,
    hide = false,
  }) : this(
          key: key,
          icon:
              hide ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          status: status,
        );

  /// Calendar Icon
  SermanosIcons.calendarFilled({
    Key? key,
    required SermanosIconStatus status,
    hide = false,
  }) : this(
          key: key,
          icon: Icons.calendar_month,
          status: status,
        );

  /// Favourite Icon
  SermanosIcons.favoriteFilled({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.favorite,
          status: status,
        );

  SermanosIcons.favoriteOutlined({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.favorite_outline,
          status: status,
        );

  /// Search Icon
  SermanosIcons.search({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.search,
          status: status,
        );

  /// Add Icon
  SermanosIcons.add({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.add,
          status: status,
        );

  /// Back Icon
  SermanosIcons.back({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.arrow_back,
          status: status,
        );

  /// Check Icon
  SermanosIcons.check({
    Key? key,
    required SermanosIconStatus status,
    checked = false,
  }) : this(
          key: key,
          icon: checked
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
          status: status,
        );

  /// Location Icon
  ///   /// Location Icon
  SermanosIcons.locationFilled({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.location_on,
          status: status,
        );

  SermanosIcons.locationOutlined({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.location_on_outlined,
          status: status,
        );

  /// Close Icon
  SermanosIcons.close({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.close,
          status: status,
        );

  /// Person Icon
  SermanosIcons.people({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.person,
          status: status,
        );

  /// Error Icon
  SermanosIcons.errorFilled({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.error,
          status: status,
        );

  SermanosIcons.errorOutlined({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.error_outline,
          status: status,
        );

  /// List Icon
  SermanosIcons.list({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.list,
          status: status,
        );

  /// Map Icon
  SermanosIcons.map({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.map_outlined,
          status: status,
        );

  /// Account Icon
  SermanosIcons.account({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.account_circle,
          status: status,
          size: 110,
        );
}

enum SermanosIconStatus {
  enabled(SermanosColors.neutral0),
  enabledSecondary(SermanosColors.neutral75),
  disabled(SermanosColors.neutral25),
  disabledSecondary(SermanosColors.secondary80),
  activated(SermanosColors.primary100),
  activatedSecondary(SermanosColors.secondary200),
  activatedTerciary(SermanosColors.secondary100),
  error(SermanosColors.error100),
  back(SermanosColors.neutral0);

  final Color color;

  const SermanosIconStatus(this.color);
}
