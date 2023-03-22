import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/config/theme/app_text_styles.dart';
import 'package:sermanos/features/auth/presentation/screens/landing_screen.dart';

import '../../../../config/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                    "¡Bienvenido!",
                    style: AppTextStyles.headline01,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                    style: AppTextStyles.subtitle01,
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
                    onPressed: () => context.beamToNamed(LandingScreen.route),
                    child: Text(
                      'Comenzar',
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.neutral0,
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
