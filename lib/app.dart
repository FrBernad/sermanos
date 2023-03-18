import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';

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
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: mainBeamerDelegate),

      // I10n
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Debugging
      debugShowCheckedModeBanner: false,
    );
  }
}
