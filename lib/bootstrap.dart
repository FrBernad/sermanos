import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/logger/logger.dart';
import 'config/providers.dart' as providers;
import 'flavors.dart';

/// Initializes app dependencies before it starts
Future<ProviderContainer> bootstrap() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final container = ProviderContainer(
    overrides: [],
    observers: [
      if (F.appFlavor == Flavor.development) _LoggerProviderObserver()
    ],
  );

  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await providers.initializeProviders(container);

  return container;
}

class _LoggerProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d(
      'Provider: ${provider.name ?? provider.runtimeType}\n'
      'New Value: $newValue',
    );
  }
}
