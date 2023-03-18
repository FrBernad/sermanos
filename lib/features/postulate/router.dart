import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/router.dart';
import 'package:ser_manos/features/postulate/presentation/screens/postulate_screen.dart';

import '../core/router.dart';

class PostulateLocation extends BeamLocation<BeamState> {
  PostulateLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/',
        '/${PostulateScreen.routeName}/*',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = RootNavigationLocation().buildPages(context, state);
    return pages;
  }

  bool _onPopPage(BuildContext context, BeamerDelegate delegate, _, page) {
    delegate.update(
      configuration: const RouteInformation(
        location: PostulateScreen.route,
      ),
      rebuild: false,
    );
    return true;
  }
}
