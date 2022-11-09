import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';

///Created by Neeraj Vijayvargiya on 08/11/22.
class ArduinoSerialConnectivity {
  FlutterBluetoothSerial instance = FlutterBluetoothSerial.instance;
  BluetoothState _state = BluetoothState.UNKNOWN;
  List<BluetoothDevice> list = [];
  void start(BuildContext context) async {
    print("inside start");
    if (instance.isEnabled == true) {
      showBondedDevices(context);
    } else {
      enableBluetoth(context);
    }
    // await instance.state.then((value) => () {
    //       print("then state=" + value.stringValue);
    //
    //       _state = value;
    //       if (_state == BluetoothState.STATE_OFF) {
    //
    //       } else if (_state == BluetoothState.STATE_ON) {
    //         showBondedDevices();
    //       }
    //     });

    instance.onStateChanged().listen((event) {
      _state = event;
      print("adapter state=" + event.stringValue);
      if (_state == BluetoothState.STATE_OFF) {
        enableBluetoth(context);
      } else if (_state == BluetoothState.STATE_ON) {
        showBondedDevices(context);
      }
    });
  }

  void enableBluetoth(BuildContext context) {
    instance.requestEnable().then((value) => {
          if (value == true) {showBondedDevices(context)}
        });
  }

  void showBondedDevices(BuildContext context) async {
    print("inside bonded devices");

    await instance.getBondedDevices().then((value) => () {
          for (BluetoothDevice d in value) {
            list.add(d);
            print("devices found=" + d.address);
          }
          showBottomDialog(context);
        });
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
                            list[index].name!,
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

  void connectToBluetooth(BluetoothDevice d) {}
}
