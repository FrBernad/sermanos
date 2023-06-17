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
import '../../../../config/providers.dart';
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

    await ref.read(signUpControllerProvider.notifier).signUp(
          name: name,
          surname: surname,
          email: email,
          password: password,
        );

    await ref.read(firebaseAnalyticsProvider).logSignUp(
          signUpMethod: 'email_and_password',
        );
    ref.read(mainBeamerDelegateProvider).popToNamed(WelcomeScreen.route);
  }
}
