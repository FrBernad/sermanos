import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/router.dart';
import 'package:sermanos/features/user/presentation/screens/profile_screen.dart';

import '../core/router.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        ProfileScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = RootNavigationLocation().buildPages(context, state);
    return pages;
  }

  bool _onPopPage(BuildContext context, BeamerDelegate delegate, _, page) {
    delegate.update(
      configuration: const RouteInformation(
        location: ProfileScreen.route,
      ),
      rebuild: false,
    );
    return true;
  }
}
