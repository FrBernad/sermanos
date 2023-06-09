import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/cellules/forms/sermanos_sign_in_form.dart';

import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import '../../application/controllers/sign_in_controller.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool loading = false;

    ref.watch(signInControllerProvider).maybeWhen(
          orElse: () {},
          loading: () => loading = true,
        );

    return SermanosCTAButton(
      text: 'Iniciar Sesión',
      onPressed: () => _onPressed(ref),
      loading: loading,
      filled: true,
    );
  }

  void _onPressed(WidgetRef ref) async {
    if (!signInFormKey.currentState!.validate()) {
      return;
    }

    final String email = signInFormKey.currentState!.fields['email']!.value;
    final String password =
        signInFormKey.currentState!.fields['password']!.value;

    await ref.read(signInControllerProvider.notifier).signIn(
          email: email,
          password: password,
        );
  }
}
