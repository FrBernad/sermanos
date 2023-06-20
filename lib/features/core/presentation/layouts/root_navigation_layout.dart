import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/features/core/utils/extensions/build_context_extension.dart';
import 'package:sermanos/features/user/presentation/screens/profile_screen.dart';

import '../../../../config/design_system/tokens/sermanos_colors.dart';
import '../../../news/presentation/screens/news_screen.dart';
import '../../../postulate/presentation/screens/postulate_screen.dart';

class RootNavigationLayout extends HookConsumerWidget {
  const RootNavigationLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useRef(_getCurrentTabIndex(context.beamerRootPath));

    final tabController = useTabController(
      initialLength: 3,
      initialIndex: currentIndex.value,
    );

    useBeamerTabNavigationListener(tabController, currentIndex);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            color: SermanosColors.secondary100,
            child: TabBar(
              controller: tabController,
              onTap: (int idx) =>
                  _onTap(context, currentIndex, tabController.index),
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
              children: const <Widget>[
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
    ObjectRef<int> currentIndex,
    int newIndex,
  ) {
    if (currentIndex.value != newIndex) {
      currentIndex.value = newIndex;
      Beamer.of(context).update(
        configuration: RouteInformation(
          location: _getCurrentLocationPath(newIndex),
        ),
        rebuild: true,
      );
    }
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

  void useBeamerTabNavigationListener(
    TabController tabController,
    ObjectRef<int> currentIndex,
  ) {
    final context = useContext();
    final beamerDelegate = Beamer.of(context);

    useEffect(() {
      listener() {
        if (context.beamerPathSegments.length == 1) {
          final newPathIndex = _getCurrentTabIndex(context.beamerRootPath);
          if (newPathIndex != -1 && newPathIndex != currentIndex.value) {
            tabController.animateTo(newPathIndex);
            currentIndex.value = newPathIndex;
          }
        }
      }

      beamerDelegate.addListener(listener);
      return () => beamerDelegate.removeListener(listener);
    }, []);
  }
}
