import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sermanos/config/design_system/cellules/modals/sermanos_permission_modal.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';
import 'package:sermanos/features/core/providers.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../../config/design_system/tokens/sermanos_typography.dart';
import '../../../postulate/providers.dart';

class WelcomeScreen extends ConsumerWidget {
  static const route = "/welcome";
  static const routeName = "welcome";

  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/sermanos_logo_square.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "¡Bienvenido!",
                    style: SermanosTypography.headline01(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                    style: SermanosTypography.subtitle01(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SermanosCTAButton(
                    text: "Comenzar",
                    onPressed: () async {
                      await _checkLocationPermission(context, ref);
                      await _checkEventTrackerPermission(context, ref);
                      if (context.mounted) {
                        context.popToNamed(PostulateScreen.route);
                      }
                    },
                    filled: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkEventTrackerPermission(
      BuildContext context, WidgetRef ref) async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      var permission = await ref.read(eventPermissionProvider.future);
      if (context.mounted) {
        if (permission.isDenied) {
          await _showPermissionEventDialog(context);
          permission = await Permission.appTrackingTransparency.request();
        }
        if (permission.isGranted) {
          ref.invalidate(eventPermissionProvider);
        }
      }
    }
  }

  _showPermissionEventDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SermanosPermissionModal(
        title: "Monitoreo de eventos",
        content:
            "Sermanos solicita permiso para monitorear tu actividad en la aplicación. Esto no será compartido con nadie.",
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

  Future<void> _checkLocationPermission(
      BuildContext context, WidgetRef ref) async {
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
    }
  }

  _showPermissionLocationDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SermanosPermissionModal(
        title: "Acceso a ubicación",
        content:
            "Para poder mostrarte los voluntariados cercanos, necesitamos acceder a tu ubicación.",
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
        content: "Recuerda que para que te mostremos los voluntariados "
            "cercanos es necesario que nos brindes tu ubicación. "
            "Por favor, habilita el acceso en la "
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
