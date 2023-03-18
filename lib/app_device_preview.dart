import 'package:beamer/beamer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';

class AppDevicePreview extends StatelessWidget {
  const AppDevicePreview({super.key});

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

      // Device Preview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
