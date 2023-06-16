import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sermanos/config/design_system/cellules/modals/sermanos_permission_modal.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_short_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/config/router/router.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';
import 'package:sermanos/features/core/providers.dart';

import '../../../../config/design_system/cellules/forms/sermanos_sign_up_form.dart';
import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../application/controllers/sign_up_controller.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool loading = false;

    ref.watch(signUpControllerProvider).maybeWhen(
          orElse: () {},
          loading: () => loading = true,
        );

    return SermanosCTAButton(
      text: 'Registrarse',
      onPressed: () => _onPressed(ref, context),
      loading: loading,
      filled: true,
    );
  }

  void _onPressed(WidgetRef ref, BuildContext context) async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    final String name = signUpFormKey.currentState!.fields['name']!.value;
    final String surname = signUpFormKey.currentState!.fields['surname']!.value;
    final String email = signUpFormKey.currentState!.fields['email']!.value;
    final String password =
        signUpFormKey.currentState!.fields['password']!.value;

    final success = await ref.read(signUpControllerProvider.notifier).signUp(
          name: name,
          surname: surname,
          email: email,
          password: password,
        );

    if (success) {
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
      ref.read(mainBeamerDelegateProvider).popToNamed(WelcomeScreen.route);
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
}
