import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/config/logger/logger.dart';
import 'package:ser_manos/features/news/presentation/screens/news_screen.dart';
import 'package:ser_manos/features/postulate/presentation/screens/postulate_screen.dart';
import 'package:ser_manos/features/profile/presentation/screens/profile_screen.dart';

class RootNavigationLayout extends HookConsumerWidget {
  const RootNavigationLayout({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(
      initialLength: 3,
      initialIndex: initialIndex,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
        bottom: TabBar(
          controller: tabController,
          onTap: (int idx) => _onTap(context, tabController.index),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const UnderlineTabIndicator(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              width: 4.0,
              color: Colors.white,
            ),
            insets: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          splashBorderRadius: BorderRadius.zero,
          tabs: const <Widget>[
            Tab(
              text: 'Postularse',
            ),
            Tab(
              text: 'Mi Perfil',
            ),
            Tab(
              text: 'Novedades',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          PostulateScreen(),
          ProfileScreen(),
          NewsScreen(),
        ],
      ),
    );
  }

  void _onTap(
    BuildContext context,
    int index,
  ) {
    logger.d(index);
    Beamer.of(context).update(
      configuration: RouteInformation(
        location: _getCurrentLocationPath(index),
      ),
      rebuild: false,
    );
  }

  String _getCurrentLocationPath(int idx) {
    switch (idx) {
      case 0:
        return PostulateScreen.route;
      case 1:
        return ProfileScreen.route;
      case 2:
        return NewsScreen.route;
    }

    return PostulateScreen.route;
  }
}
