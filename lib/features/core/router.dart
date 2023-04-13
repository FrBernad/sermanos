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
    return [
      const BeamPage(
        key: ValueKey('root-navigation'),
        type: BeamPageType.noTransition,
        child: RootNavigationLayout(),
      )
    ];
  }
}
