import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_detail_screen.dart';
import 'package:sermanos/features/postulate/presentation/screens/postulate_screen.dart';

import '../core/router.dart';

class PostulateLocation extends BeamLocation<BeamState> {
  PostulateLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        PostulateScreen.route,
        PostulateDetailScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = RootNavigationLocation().buildPages(context, state);

    if (state.pathParameters.containsKey('id')) {
      String id = state.pathParameters["id"]!;
      pages.add(
        BeamPage(
          key: ValueKey('postulate-$id'),
          title: 'Postulate $id',
          child: PostulateDetailScreen(postulateId: id),
        ),
      );
    }

    return pages;
  }
}
