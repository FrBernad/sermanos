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

  /*
  ----------------------------
     Mostrar Icon
  ----------------------------
  */

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

  //FIXME: two Tone???
  // SermanosIcons.showTwoTone({
  //   Key? key,
  //   required SermanosIconStatus status,
  //   hide = false,
  // }) : this(
  //   key: key,
  //   icon:
  //   hide ? Icons.visibility_outlined : Icons.visibility_off_outlined,
  //   status: status,
  // );

  /*
  ----------------------------
     Calendar Icon
  ----------------------------
  */

  //FIXME: two tone???
  SermanosIcons.calendarFilled({
    Key? key,
    required SermanosIconStatus status,
    hide = false,
  }) : this(
          key: key,
          icon: Icons.calendar_month,
          status: status,
        );

  /*
  ----------------------------
    Favorito Icon
  ----------------------------
  */
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

  /*
  ----------------------------
    Buscar Icon
  ----------------------------
  */
  SermanosIcons.search({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.search,
          status: status,
        );

  /*
  ----------------------------
    Añadir Icon
  ----------------------------
  */

  SermanosIcons.add({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.add,
          status: status,
        );

  /*
  ----------------------------
     Atrás Icon
  ----------------------------
  */

  SermanosIcons.back({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.arrow_back,
          status: status,
        );

  /*
  ----------------------------
     Radio Icon
  ----------------------------
  */

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

  /*
  ----------------------------
     Location Icon
  ----------------------------
  */

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

  //FIXME: two Tone???
  SermanosIcons.locationTwoTone({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.location_on_outlined,
          status: status,
        );

  /*
  ----------------------------
     Cerrar Icon
  ----------------------------
  */

  SermanosIcons.close({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.close,
          status: status,
        );

  /*
  ----------------------------
     Persona Icon
  ----------------------------
  */

  SermanosIcons.people({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.person,
          status: status,
        );

  /*
  ----------------------------
     Error Icon
  ----------------------------
  */

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

  //FIXME: two Tone??
  // SermanosIcons.errorOutlined({
  //   Key? key,
  //   required SermanosIconStatus status,
  // }) : this(
  //   key: key,
  //   icon: Icons.error_outline,
  //   status: status,
  // );

  /*
  ----------------------------
     Lista Icon
  ----------------------------
  */

  SermanosIcons.list({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.list,
          status: status,
        );

  /*
  ----------------------------
     Mapa Icon
  ----------------------------
  */

  //FIXME: two tone
  SermanosIcons.map({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.map,
          status: status,
        );

  /*
  ----------------------------
     Location Icon
  ----------------------------
  */

  SermanosIcons.location({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.location_on,
          status: status,
        );

  /*
  ----------------------------
     Location Icon
  ----------------------------
  */

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
  disabled(SermanosColors.neutral25),
  disabledSecondary(SermanosColors.secondary80),
  activated(SermanosColors.primary100),
  activatedSecondary(SermanosColors.secondary200),
  activatedTerciary(SermanosColors.secondary100),
  error(SermanosColors.error100),
  //FIXME: como arreglo esto?
  back(SermanosColors.neutral0);

  final Color color;

  const SermanosIconStatus(this.color);
}
