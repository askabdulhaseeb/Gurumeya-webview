import 'package:connectivity/connectivity.dart';

class CheckInternet {
  static Future<int> isConnected() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return 0;
    } else if (result == ConnectivityResult.mobile) {
      return 1;
    } else if (result == ConnectivityResult.wifi) {
      return 1;
    } else {
      return 0;
    }
  }
}
