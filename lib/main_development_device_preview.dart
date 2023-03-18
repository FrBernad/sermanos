import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_device_preview.dart';
import 'bootstrap.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.development;

  ProviderContainer container = await bootstrap();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => // Wrap your app
          UncontrolledProviderScope(
        container: container,
        child: const AppDevicePreview(),
      ),
    ),
  );

  FlutterNativeSplash.remove();
}
