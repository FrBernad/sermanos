import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/features/auth/presentation/screens/landing_screen.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';

import '../../../../config/design_system/tokens/ds_colors.dart';
import '../../../../config/design_system/tokens/ds_typography.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = "/auth/welcome";
  static const routeName = "welcome";

  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

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
                    style: DesignSystemTypography.headline01,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                    style: DesignSystemTypography.subtitle01,
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
                      'Comenzar',
                      style: DesignSystemTypography.button.copyWith(
                        color: DesignSystemColors.neutral0,
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
