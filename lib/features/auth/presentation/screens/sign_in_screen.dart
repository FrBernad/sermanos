import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sermanos/config/design_system/molecules/buttons/sermanos_CTA_button.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_up_screen.dart';

import '../../../../config/design_system/cellules/forms/sermanos_sign_in_form.dart';
import '../widgets/sign_in_button.dart';

final loginFormKey = GlobalKey<FormBuilderState>();

class SignInScreen extends StatelessWidget {
  static const route = "/auth/signIn";
  static const routeName = "signIn";

  const SignInScreen({Key? key}) : super(key: key);

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
                  const SermanosSignInForm(),
                ],
              ),
              const SizedBox(height: 120),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SignInButton(),
                  const SizedBox(height: 16),
                  SermanosCTAButton(
                    text: 'No tengo cuenta',
                    onPressed: () => context.beamToNamed(SignUpScreen.route),
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
