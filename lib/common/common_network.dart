import 'package:connectivity/connectivity.dart';

class CommonNetwork{

  /// is connect to internet
  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }else if(connectivityResult == ConnectivityResult.none){
      return false;
    }
    return false;
  }


}