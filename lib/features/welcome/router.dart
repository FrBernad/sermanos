import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/router.dart';
import 'package:sermanos/features/profile/presentation/screens/profile_screen.dart';

import '../auth/presentation/screens/welcome_screen.dart';
import '../core/router.dart';

class WelcomeLocation extends BeamLocation<BeamState> {
  WelcomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        WelcomeScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];
    pages.add(
      const BeamPage(
        key: ValueKey('welcome'),
        child: WelcomeScreen(),
      ),
    );
    return pages;
  }
}
