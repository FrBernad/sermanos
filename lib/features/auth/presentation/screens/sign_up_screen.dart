import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/config/design_system/cellules/forms/sermanos_sign_up_form.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:sermanos/features/auth/presentation/widgets/sign_up_button.dart';

import '../../../../config/design_system/molecules/buttons/sermanos_CTA_button.dart';

class SignUpScreen extends ConsumerWidget {
  static const route = "/auth/signUp";
  static const routeName = "signUp";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  const SermanosSignUpForm(),
                  const SizedBox(height: 50),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SignUpButton(),
                  const SizedBox(height: 16),
                  SermanosCTAButton(
                    text: 'Ya tengo cuenta',
                    onPressed: () => context.beamToNamed(SignInScreen.route),
                    textColor: SermanosColors.primary100,
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
