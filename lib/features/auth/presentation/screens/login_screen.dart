import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sermanos/features/auth/presentation/screens/register_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';
import 'package:sermanos/features/auth/presentation/widgets/form_text_field.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_detail_screen.dart';

import '../../../../config/design_system/tokens/ds_colors.dart';
import '../../../../config/design_system/tokens/ds_typography.dart';
import '../../../postulate/presentation/screens/postulate_screen.dart';

final _loginFormKey = GlobalKey<FormBuilderState>();

class LoginScreen extends StatelessWidget {
  static const route = "/auth/login";
  static const routeName = "login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
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
                    key: _loginFormKey,
                    child: Column(
                      children: const [
                        FormTextField(
                          formField: 'email',
                          initialValue: '',
                          label: 'Email',
                        ),
                        SizedBox(height: 24),
                        FormTextField(
                          formField: 'password',
                          initialValue: '',
                          label: 'Contraseña',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120),
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
                    onPressed: () => context.beamToNamed(PostulateScreen.route),
                    child: Text(
                      'Inciar Sesión',
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
                    onPressed: () => context.beamToNamed(RegisterScreen.route),
                    child: Text(
                      'No tengo cuenta',
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
