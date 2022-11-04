import 'package:connectivity/connectivity.dart';
import 'package:neeraj_flutter_app/utils/logger.dart';

///Created by Naman Gupta on 19/4/21.
class InternetConnectivity {
  late Connectivity _connectivity;

  InternetConnectivity() {
    _connectivity = Connectivity();
  }

  Future<bool> checkConnection() async {
    Logger.logd("internet function called");
    if (await _connectivity.checkConnectivity() == ConnectivityResult.mobile ||
        await _connectivity.checkConnectivity() == ConnectivityResult.wifi)
      return true;
    else
      return false;
  }

  Stream<ConnectivityResult> checkStatus() {
    return _connectivity.onConnectivityChanged;
  }
}
