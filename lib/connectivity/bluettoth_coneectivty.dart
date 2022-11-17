import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';
import 'package:permission_handler/permission_handler.dart';

class BleConnectivity {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothCharacteristic writeCharacterstics;
  late BluetoothCharacteristic readCharacterstics;
  late BluetoothDeviceState _deviceState;
  late final Function showBottomDialog;
  late final connectBluetoothBle;
  late final onRecvData;

  FlutterBlue getInstance() {
    flutterBlue ??= FlutterBlue.instance;
    return flutterBlue;
  }

  void connectToBluetooth(ScanResult r) {
    r.device.connect().then((value) => r.device.state.listen((event) {
          print("device connection state=$event");
          _deviceState = event;
          connectBluetoothBle(event, r);
          if (event == BluetoothDeviceState.connected) {
            listenForServices(r);
          }
        }));
  }

  void writeToBle(List<int> value) {
    if (_deviceState == BluetoothDeviceState.connected) {
      if (writeCharacterstics != null) {
        writeCharacterstics.write(value);
      }
    }
  }

  void readFromBle() async {
    List<int> value = await readCharacterstics.read();
    if (value.isNotEmpty) {
      print("read data from char=" + value.toString());
    }
  }

  void listenForServices(ScanResult r) async {
    List<BluetoothService> services = await r.device.discoverServices();
    for (BluetoothService service in services) {
      print("service uuid=" + service.uuid.toString());
      if (service.uuid.toString().trim().toUpperCase() ==
          "0000FFE0-0000-1000-8000-00805F9B34FB") {
        print("service uuid found");
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          print("characterstics uuid=" + c.uuid.toString());
          if (c.uuid.toString().trim().toUpperCase() ==
              "0000FFE1-0000-1000-8000-00805F9B34FB") {
            print("character uuid found");
            readCharacterstics = c;
            writeCharacterstics = c;

            // if (c.properties.read) {
            //   readCharacterstics = c;
            // } else if (c.properties.write) {
            //   writeCharacterstics = c;
            // }
          }
        }
      }
    }
    await readCharacterstics.setNotifyValue(true);
    readCharacterstics.value.listen((event) {
      onRecvData(event);
      print("read data from stream listener=" + event.toString());
    });
  }

  void disconnectToBluetooth(ScanResult r) async {
    await r.device.disconnect();
  }

  void askRuntimePermissions(BuildContext context, Function showBottomDialog,
      Function connectBleDevice, Function onRecvBleData) async {
    this.showBottomDialog = showBottomDialog;
    this.connectBluetoothBle = connectBleDevice;
    this.onRecvData = onRecvBleData;
    // Permission.bluetoothConnect,
    // Permission.bluetoothAdvertise,
    // Permission.bluetooth,

    Map<Permission, PermissionStatus> statuses =
        await [Permission.bluetoothConnect, Permission.bluetoothScan].request();
    if (statuses[Permission.bluetoothConnect] == PermissionStatus.granted) {
      print(statuses[Permission.bluetoothConnect]);
      listenState(context);
      //showBottomDialog(context);
    }
  }

  Widget bluettothStateCheck(var state, BuildContext context) {
    if (state == BluetoothState.on) {
      //show alert dialog
      startScanning(context);
    } else if (state == BluetoothState.off ||
        state == BluetoothState.unknown ||
        state == BluetoothState.unavailable ||
        state == BluetoothState.unauthorized) {
      showAlertMessage(
          "Please switch on bluetooth to connect a device", context);
    }
    return Container();
  }

  void showAlertMessage(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Alert",
          style: TextStyle(color: Colors.red),
        ),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Container(
                color: Colors.deepPurple,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "okay",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  void listenState(BuildContext context) {
    // Start scanning
    print("njvj :inside listen state");

    if (flutterBlue.isAvailable == false) {
      //show alert dialog
      showAlertMessage("Bluetooth not found", context);
      return;
    }
    flutterBlue.state.listen((event) {
      print("njvj :$event");
      bluettothStateCheck(event, context);
    });
  }

  void startScanning(BuildContext context) {
    flutterBlue.startScan(timeout: Duration(seconds: 5));
// Listen to scan results
    showBottomDialog(flutterBlue.scanResults);
    // var subscription = flutterBlue.scanResults.listen((results) {
    //   // do something with scan results
    //   for (ScanResult r in results) {
    //     print('${r.device.name} found! rssi: ${r.rssi}');
    //     pushScanResult(r);
    //   }
    // });

// Stop scanning
    flutterBlue.stopScan();
  }
}
