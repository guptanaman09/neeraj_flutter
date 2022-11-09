import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';
import 'package:permission_handler/permission_handler.dart';

class BleConnectivity {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> list = [];
  late BluetoothCharacteristic writeCharacterstics;
  late BluetoothDeviceState _deviceState;

  FlutterBlue getInstance() {
    flutterBlue ??= FlutterBlue.instance;
    return flutterBlue;
  }

  void connectToBluetooth(ScanResult r) {
    r.device.connect().then((value) => r.device.state.listen((event) {
          print("device connection state=$event");
          _deviceState = event;
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

  void listenForServices(ScanResult r) async {
    List<BluetoothService> services = await r.device.discoverServices();
    for (BluetoothService service in services) {
      var characteristics = service.characteristics;
      for (BluetoothCharacteristic c in characteristics) {
        var descriptors = c.descriptors;
        for (BluetoothDescriptor d in descriptors) {
          List<int> value = await d.read();
          print("read data from descriptors=" + String.fromCharCodes(value));
        }
        if (c.properties.read) {
          List<int> value = await c.read();
          if (value.isNotEmpty) {
            print("read data from char=" + String.fromCharCodes(value));
          }
        }
        if (c.properties.write) {
          writeCharacterstics = c;
        }
      }
    }

    writeToBle([0x12, 0x34]);
  }

  void disconnectToBluetooth(ScanResult r) async {
    await r.device.disconnect();
  }

  void showBottomDialog(BuildContext context) {
    showModalBottomSheet(
        constraints: BoxConstraints(maxWidth: 200, minHeight: 100),
        context: context,
        builder: (context) {
          return Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      connectToBluetooth(list[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Row(
                        children: [
                          HorizontalGap(10),
                          Icon(
                            Icons.bluetooth,
                            color: Colors.blue,
                            size: 20,
                          ),
                          HorizontalGap(10),
                          Text(
                            list[index].device.name,
                            style: TextStyle(
                                fontSize: 15, color: Colors.lightGreen),
                          ),
                          HorizontalGap(10),
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
        isDismissible: true,
        useRootNavigator: false,
        isScrollControlled: false,
        backgroundColor: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))));
  }

  void askRuntimePermissions(BuildContext context) async {
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
    list.clear();
// Listen to scan results

    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        list.add(r);
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
      if (list.length > 0) {
        showBottomDialog(context);
      }
    });

// Stop scanning
    flutterBlue.stopScan();
  }
}
