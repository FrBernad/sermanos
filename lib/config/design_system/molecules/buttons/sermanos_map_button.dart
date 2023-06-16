import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';

import '../../../../features/postulate/application/controllers/postulate_view_mode_controller.dart';
import '../../../../features/postulate/providers.dart';
import '../../atoms/icons/sermanos_icons.dart';
import '../../cellules/modals/sermanos_permission_modal.dart';
import '../../tokens/sermanos_colors.dart';

class SermanosMapButton extends ConsumerWidget {
  const SermanosMapButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: SermanosIcons.map(status: SermanosIconStatus.activated),
      onPressed: () async {
        var permission = await ref.read(locationPermissionProvider.future);
        if (context.mounted) {
          if (permission.isDenied) {
            await _showPermissionLocationDialog(context);
            permission = await Permission.locationWhenInUse.request();
            if (!permission.isDenied) {
              ref.invalidate(locationPermissionProvider);
            }
          }
        }
        if (permission.isPermanentlyDenied) {
          if (context.mounted) {
            await _showPermanentlyDeniedPermissionDialog(context);
          }
        } else if (permission.isGranted) {
          if (context.mounted) {
            ref
                .watch(postulateViewModeControllerProvider.notifier)
                .set(PostulateViewMode.map);
          }
        } else {
          if (context.mounted) {
            await _showPermissionLocationDialog(context);
          }
        }
      },
    );
  }

  _showPermissionLocationDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SermanosPermissionModal(
        title: "Acceso a ubicación",
        content:
            "Para poder ver los voluntariados cercanos, necesitamos acceder a tu ubicación.",
        actions: [
          SermanosShortButton(
            filled: false,
            onPressed: () async {
              Navigator.of(context).pop();
            },
            textColor: SermanosColors.primary100,
            text: "Ok".toUpperCase(),
          ),
        ],
      ),
    );
  }

  _showPermanentlyDeniedPermissionDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SermanosPermissionModal(
        title: "Acceso a ubicación",
        content: "Para poder ver los voluntariados cercanos, necesitamos "
            "acceder a tu ubicación. Por favor, habilita el acceso en la "
            "configuración de tu dispositivo.",
        actions: [
          SermanosShortButton(
            filled: false,
            onPressed: () async => await openAppSettings(),
            text: "IR A CONFIGURACIÓN",
            textColor: SermanosColors.primary100,
          ),
          SermanosShortButton(
            filled: false,
            onPressed: () => Navigator.of(context).pop(),
            text: "OK",
            textColor: SermanosColors.primary100,
          ),
        ],
      ),
    );
  }
}
