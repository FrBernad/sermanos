import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/router.dart';
import 'package:sermanos/features/news/presentation/screens/news_screen.dart';
import 'package:sermanos/features/news/presentation/screens/news_details_screen.dart';

import '../core/router.dart';

class NewsLocation extends BeamLocation<BeamState> {
  NewsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        NewsScreen.route,
        NewsDetailsScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = RootNavigationLocation().buildPages(context, state);
    if (state.pathParameters.containsKey('id')) {
      String id = state.pathParameters["id"]!;
      pages.add(
        BeamPage(
          key: ValueKey('news-$id'),
          title: 'News $id',
          child: NewsDetailsScreen(newsId: id),
        ),
      );
    }

    return pages;
  }
}
