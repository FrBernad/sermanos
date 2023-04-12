import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sermanos/config/design_system/cellules/forms/sermanos_register_form.dart';
import 'package:sermanos/features/auth/presentation/screens/login_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';

import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';

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
                  const SermanosRegisterForm(),
                  const SizedBox(height: 50),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SermanosCTAButton(
                    text: 'Registrarse',
                    onPressed: () => context.beamToNamed(WelcomeScreen.route),
                    filled: true,
                  ),
                  const SizedBox(height: 16),
                  SermanosCTAButton(
                    text: 'Ya tengo cuenta',
                    onPressed: () => context.beamToNamed(LoginScreen.route),
                    filled: false,
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
