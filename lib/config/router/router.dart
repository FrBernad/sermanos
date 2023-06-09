import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/config/router/guards/auth_guard.dart';
import 'package:sermanos/config/router/guards/unauth_guard.dart';
import 'package:sermanos/features/auth/presentation/screens/landing_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';
import 'package:sermanos/features/auth/router.dart';

import '../../features/news/presentation/screens/news_screen.dart';
import '../../features/news/router.dart';
import '../../features/postulate/presentation/screens/postulate_screen.dart';
import '../../features/postulate/router.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/profile/router.dart';
import '../../features/welcome/router.dart';
import 'guards/logger.dart';

part 'generated/router.g.dart';

@Riverpod(keepAlive: true)
Raw<BeamerDelegate> mainBeamerDelegate(MainBeamerDelegateRef ref) =>
    BeamerDelegate(
      initialPath: LandingScreen.route,
      locationBuilder: _locationBuilder,
      guards: [
        routerLogger,
        AuthGuard(providerRef: ref),
        UnAuthGuard(providerRef: ref),
      ],
    );

BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
  RouteInformation routeInformation,
  BeamParameters? beamParameters,
) {
  if (routeInformation.location!.contains(LandingScreen.routeName)) {
    return AuthLocation(routeInformation);
  }
  if (routeInformation.location!.contains(WelcomeScreen.routeName)) {
    return WelcomeLocation(routeInformation);
  }
  if (routeInformation.location!.contains(PostulateScreen.routeName)) {
    return PostulateLocation(routeInformation);
  }
  if (routeInformation.location!.contains(ProfileScreen.routeName)) {
    return ProfileLocation(routeInformation);
  }
  if (routeInformation.location!.contains(NewsScreen.routeName)) {
    return NewsLocation(routeInformation);
  }
  return AuthLocation(routeInformation);
}
