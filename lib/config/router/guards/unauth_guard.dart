import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/auth/router.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';
import 'package:sermanos/features/user/providers.dart';

import '../../logger/logger.dart';

class UnAuthGuard extends BeamGuard {
  UnAuthGuard({
    required Ref providerRef,
  }) : super(
          pathPatterns: ['${AuthLocation.pathPrefix}*'],
          check: (context, location) {
            bool isAuthenticated =
                providerRef.read(currentUserProvider) != null;
            if (isAuthenticated) {
              logger.d(
                  'Should not be authorized: redirecting to ${PostulateScreen.route}');
              return false;
            }

            return true;
          },
          beamToNamed: (origin, target) => PostulateScreen.route,
        );
}
