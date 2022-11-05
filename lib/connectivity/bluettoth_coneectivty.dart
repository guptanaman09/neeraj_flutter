import 'package:flutter_blue/flutter_blue.dart';

class BleConnectivity {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  void startScanning() {
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 20));

// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

// Stop scanning
    flutterBlue.stopScan();
  }
}
