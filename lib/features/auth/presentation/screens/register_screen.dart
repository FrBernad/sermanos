import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sermanos/features/auth/presentation/screens/login_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';

import '../../../../config/design_system/tokens/ds_colors.dart';
import '../../../../config/design_system/tokens/ds_typography.dart';
import '../widgets/form_text_field.dart';

final _registerFormKey = GlobalKey<FormBuilderState>();

class RegisterScreen extends StatelessWidget {
  static const route = "/auth/register";
  static const routeName = "register";

  const RegisterScreen({Key? key}) : super(key: key);

  //FIXME: ARREGLAR OVERFLOW CON SINGLECHILDSCROLLVIEW
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Column(
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
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(DesignSystemColors.primary100),
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
                    onPressed: () => context.beamToNamed(WelcomeScreen.route),
                    child: Text(
                      'Registrarse',
                      style: DesignSystemTypography.button.copyWith(
                        color: DesignSystemColors.neutral0,
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
                      style: DesignSystemTypography.button.copyWith(
                        color: DesignSystemColors.primary100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
