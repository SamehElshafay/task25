import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  static Future<bool> hasConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }

  static Stream<ConnectivityResult> get onConnectivityChanged {
    return Connectivity().onConnectivityChanged.map((list) => list.first);
  }
}
