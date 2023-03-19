import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sermanos/features/core/presentation/layouts/root_navigation_layout.dart';

import '../postulate/presentation/screens/postulate_screen.dart';

class RootNavigationLocation extends BeamLocation<BeamState> {
  RootNavigationLocation();

  @override
  List<String> get pathPatterns => [];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final int initialIndex = _getCurrentTabIndex(state.queryParameters['tab']);
    return [
      BeamPage(
        key: const ValueKey('root-navigation'),
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
    }
    return -1;
  }
}
