import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/features/news/presentation/screens/news_screen.dart';
import 'package:ser_manos/features/news/router.dart';
import 'package:ser_manos/features/postulate/presentation/screens/postulate_screen.dart';
import 'package:ser_manos/features/postulate/router.dart';
import 'package:ser_manos/features/profile/presentation/screens/profile_screen.dart';
import 'package:ser_manos/features/profile/router.dart';

import 'guards/logger.dart';

// GoRouter configuration
final mainBeamerDelegate = BeamerDelegate(
  initialPath: PostulateScreen.route,
  locationBuilder: _locationBuilder,
  guards: [
    routerLogger,
  ],
);

BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
    RouteInformation routeInformation, BeamParameters? beamParameters) {
  if (routeInformation.location!.contains(PostulateScreen.routeName)) {
    return PostulateLocation(routeInformation);
  }
  if (routeInformation.location!.contains(ProfileScreen.routeName)) {
    return ProfileLocation(routeInformation);
  }
  if (routeInformation.location!.contains(NewsScreen.routeName)) {
    return NewsLocation(routeInformation);
  }
  return PostulateLocation(routeInformation);
}
