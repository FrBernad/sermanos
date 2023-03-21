import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../news/presentation/screens/news_screen.dart';
import '../../../postulate/presentation/screens/postulate_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

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
        title: const Image(
          image: AssetImage('assets/images/sermanos_logo_reactangle.png'),
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.secondary100,
            child: TabBar(
              controller: tabController,
              onTap: (int idx) => _onTap(context, tabController.index),
              tabs: const <Widget>[
                Tab(text: 'Postularse'),
                Tab(text: 'Mi Perfil'),
                Tab(text: 'Novedades'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                PostulateScreen(),
                ProfileScreen(),
                NewsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(
    BuildContext context,
    int index,
  ) {
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
