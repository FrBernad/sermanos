import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sermanos/features/core/presentation/layouts/root_navigation_layout.dart';
import 'package:sermanos/features/news/presentation/screens/news_screen.dart';
import 'package:sermanos/features/profile/presentation/screens/profile_screen.dart';

import '../postulate/presentation/screens/postulate_screen.dart';

class RootNavigationLocation extends BeamLocation<BeamState> {
  RootNavigationLocation();

  @override
  List<String> get pathPatterns => [];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final int initialIndex = _getCurrentTabIndex(state.uri.pathSegments.first);
    return [
      BeamPage(
        key: ValueKey('root-navigation-$initialIndex'),
        type: BeamPageType.noTransition,
        child: RootNavigationLayout(
          initialIndex: initialIndex,
        ),
      )
    ];
  }

  int _getCurrentTabIndex(String? tab) {
    switch (tab) {
      case PostulateScreen.routeName:
        return 0;
      case ProfileScreen.routeName:
        return 1;
      case NewsScreen.routeName:
        return 2;
    }
    return -1;
  }
}
