import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      onPressed: () => _onPressed(ref),
      loading: loading,
      filled: true,
    );
  }

  void _onPressed(WidgetRef ref) async {
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
  }
}
