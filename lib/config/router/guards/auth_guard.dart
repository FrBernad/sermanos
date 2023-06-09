import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/auth/router.dart';
import 'package:sermanos/features/user/providers.dart';

import '../../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../logger/logger.dart';

class AuthGuard extends BeamGuard {
  AuthGuard({
    required Ref providerRef,
  }) : super(
          guardNonMatching: true,
          pathPatterns: ['${AuthLocation.pathPrefix}*'],
          check: (context, location) {
            bool isAuthenticated =
                providerRef.read(currentUserProvider) != null;

            if (!isAuthenticated) {
              logger.d(
                  'Should be authorized: redirecting to ${SignInScreen.route}');
            }

            return isAuthenticated;
          },
          beamToNamed: (origin, target) => SignInScreen.route,
        );
}
