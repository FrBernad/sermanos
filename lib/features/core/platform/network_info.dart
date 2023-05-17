import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../config/logger/logger.dart';
import '../../../flavors.dart';

class NetworkInfo {
  NetworkInfo();

  bool hasConnection = false;

  ConnectivityResult _currentConnectivity = ConnectivityResult.none;

  late StreamSubscription<ConnectivityResult> sub;

  Future<void> initialize() async {
    final isConnected = await Connectivity().checkConnectivity();
    await _onConnectivityChange(isConnected);

    sub = Connectivity()
        .onConnectivityChanged
        .listen((result) async => await _onConnectivityChange(result));
  }

  Future<void> _onConnectivityChange(ConnectivityResult result) async {
    if (_currentConnectivity != result) {
      _currentConnectivity = result;
      if (F.appFlavor == Flavor.development) {
        logger.d("Changed Connectivity: $result");
      }
    }
    if (result != ConnectivityResult.none) {
      hasConnection = await InternetConnectionChecker().hasConnection;
    } else {
      hasConnection = false;
    }
  }

  void dispose() {
    sub.cancel();
  }
}
