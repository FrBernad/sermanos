import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';

import '../auth/presentation/screens/welcome_screen.dart';

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
