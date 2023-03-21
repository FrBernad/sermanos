import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sermanos/features/auth/presentation/screens/login_screen.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../postulate/presentation/screens/postulate_detail_screen.dart';
import '../../../postulate/presentation/screens/postulate_screen.dart';
import '../widgets/form_text_field.dart';

final _registerFormKey = GlobalKey<FormBuilderState>();

class RegisterScreen extends StatelessWidget {
  static const route = "/auth/register";
  static const routeName = "register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  FormBuilder(
                    key: _registerFormKey,
                    child: Column(
                      children: const [
                        FormTextField(
                          formField: 'name',
                          initialValue: '',
                          label: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          placeholder: 'Ej: Juan',
                        ),
                        SizedBox(height: 24),
                        FormTextField(
                          formField: 'surname',
                          initialValue: '',
                          label: 'Apellido',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          placeholder: 'Ej: Barcena',
                        ),
                        SizedBox(height: 24),
                        FormTextField(
                          formField: 'email',
                          initialValue: '',
                          label: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          placeholder: 'Ej: juanbarcena@gmail.com',
                        ),
                        SizedBox(height: 24),
                        FormTextField(
                          formField: 'password',
                          initialValue: '',
                          label: 'Contraseña',
                          password: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          placeholder: 'Ej: ABCD1234',
                        ),
                      ],
                    ),
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
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primary100),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        context.beamToNamed(PostulateScreen.route),
                    child: Text(
                      'Registrarse',
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.neutral0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                      ),
                    ),
                    onPressed: () => context.beamToNamed(LoginScreen.route),
                    child: Text(
                      'Ya tengo cuenta',
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.primary100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
