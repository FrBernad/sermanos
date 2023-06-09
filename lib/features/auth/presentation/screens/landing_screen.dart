import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_typography.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_up_screen.dart';

class LandingScreen extends StatelessWidget {
  static const route = "/auth";
  static const routeName = "auth";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Text(
                    "“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”",
                    style: SermanosTypography.subtitle01(),
                    textAlign: TextAlign.center,
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
                  SermanosCTAButton(
                    text: 'Iniciar Sesión',
                    filled: true,
                    onPressed: () => context.beamToNamed(SignInScreen.route),
                  ),
                  const SizedBox(height: 16),
                  SermanosCTAButton(
                    text: 'Registrarse',
                    filled: false,
                    onPressed: () => context.beamToNamed(SignUpScreen.route),
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
