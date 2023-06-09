import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/auth/application/controllers/sign_up_controller.dart';

import '../../molecules/inputs/sermanos_text_field.dart';
import '../../tokens/sermanos_colors.dart';

final signUpFormKey = GlobalKey<FormBuilderState>();

class SermanosSignUpForm extends ConsumerWidget {
  const SermanosSignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = false;
    String? errorText;

    ref.watch(signUpControllerProvider).maybeWhen(
          orElse: () {},
          error: (error, __) => errorText = error.toString(),
          // FirebaseAuthErrorTranslator.translate(context, error.toString()),
          loading: () => isLoading = true,
        );

    return FormBuilder(
      key: signUpFormKey,
      enabled: !isLoading,
      child: Column(
        children: [
          SermanosTextField(
            formField: 'name',
            initialValue: '',
            enabled: !isLoading,
            label: 'Nombre',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: Juan',
          ),
          const SizedBox(height: 24),
          SermanosTextField(
            formField: 'surname',
            initialValue: '',
            enabled: !isLoading,
            label: 'Apellido',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: Barcena',
          ),
          const SizedBox(height: 24),
          SermanosTextField(
            formField: 'email',
            initialValue: '',
            enabled: !isLoading,
            label: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: juanbarcena@gmail.com',
          ),
          const SizedBox(height: 24),
          SermanosTextField(
            formField: 'password',
            initialValue: '',
            enabled: !isLoading,
            label: 'Contraseña',
            password: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: ABCD1234',
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
