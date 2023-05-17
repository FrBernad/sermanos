import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/l10n/app_localizations.dart';

import 'config/design_system/theme.dart';
import 'config/router/router.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,

      // Theme
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
      themeMode: ThemeMode.light,

      // Routing
      routerDelegate: mainBeamerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: mainBeamerDelegate,
      ),

      // I10n
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Debugging
      debugShowCheckedModeBanner: false,
    );
  }
}
