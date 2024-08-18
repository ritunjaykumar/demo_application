import 'package:connectivity_plus/connectivity_plus.dart';

import '../../application/initializer.dart';

class Network {
  Future<bool> get checkNetworkStatus async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.vpn) ||
        connectivityResult.contains(ConnectivityResult.bluetooth) ||
        connectivityResult.contains(ConnectivityResult.other)) {
      logger.i('connected to $connectivityResult');
      return true;
    } else {
      logger.i('not connect to internet');
      return false;
    }
  }
}
