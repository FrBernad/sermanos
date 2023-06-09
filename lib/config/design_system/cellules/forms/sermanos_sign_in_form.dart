import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/auth/application/controllers/sign_in_controller.dart';

import '../../molecules/inputs/sermanos_text_field.dart';
import '../../tokens/sermanos_colors.dart';
import '../../tokens/sermanos_typography.dart';

final signInFormKey = GlobalKey<FormBuilderState>();

class SermanosSignInForm extends ConsumerWidget {
  const SermanosSignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = false;
    String? errorText;

    ref.watch(signInControllerProvider).maybeWhen(
          orElse: () {},
          error: (error, __) => errorText = error.toString(),
          // FirebaseAuthErrorTranslator.translate(context, error.toString()),
          loading: () => isLoading = true,
        );
    return FormBuilder(
      key: signInFormKey,
      enabled: !isLoading,
      child: Column(
        children: [
          SermanosTextField(
            formField: 'email',
            initialValue: '',
            label: 'Email',
            enabled: !isLoading,
          ),
          const SizedBox(height: 24),
          SermanosTextField(
            formField: 'password',
            initialValue: '',
            label: 'Contraseña',
            enabled: !isLoading,
          ),
          if (errorText != null)
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  errorText!,
                  style: const SermanosTypography.caption(
                    color: SermanosColors.error100,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
