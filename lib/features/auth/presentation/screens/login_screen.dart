import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/features/auth/presentation/screens/register_screen.dart';

import '../../../../config/design_system/cellules/forms/sermanos_login_form.dart';
import '../../../postulate/presentation/screens/postulate_screen.dart';

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
                  const SermanosLoginForm(),
                ],
              ),
              const SizedBox(height: 120),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SermanosCTAButton(
                    text: 'Inciar Sesión',
                    onPressed: () => context.beamToReplacementNamed(PostulateScreen.route),
                    filled: true,
                  ),
                  const SizedBox(height: 16),
                  SermanosCTAButton(
                    text: 'No tengo cuenta',
                    onPressed: () => context.beamToNamed(RegisterScreen.route),
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
