import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/connectivity/bluetooth_serial_connectivty.dart';
import 'package:neeraj_flutter_app/connectivity/bluettoth_coneectivty.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/button_style.dart';
import 'package:neeraj_flutter_app/models/category_data.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';

///Created by Naman Gupta on 9/11/22.

class FreeRunScreen extends StatefulWidget {
  SubCategoryDetail subCategoryDetail;

  FreeRunScreen(this.subCategoryDetail);

  @override
  State<StatefulWidget> createState() {
    return FreeRunScreenState(subCategoryDetail);
  }
}

class FreeRunScreenState extends BaseClass with SingleTickerProviderStateMixin {
  SubCategoryDetail subCategoryDetail;
  bool isAnyBluetoothConnected = false;
  bool ifBleConnected = false;
  bool ifSerialConnected = false;
  ArduinoSerialConnectivity? connectivity = null;
  BleConnectivity? bleConnect = null;
  FreeRunScreenState(this.subCategoryDetail);
  ScanResult? scanResult;
  double redSliderValue = 0;
  double greenSliderValue = 0;
  double blueSliderValue = 0;
  double ultrasonicValue = 0;
  List<ScanResult> list = [];

  late AnimationController _animationController;
  bool ultrasonicSwitchValue = false;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 150));
    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget? setBody() {
    return Container(
      height: DeviceUtils.getScreenHeight(context),
      width: DeviceUtils.getScreenWidtht(context),
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Stack(
        children: [
          Positioned(
              left: 50,
              child: Container(
                height: DeviceUtils.getScreenHeight(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      Assets.UP_ARROW,
                      width: 100,
                      height: 100,
                    ),
                    VerticalGap(32),
                    Image.asset(
                      Assets.DOWN_ARROW,
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              )),
          Positioned(
              right: 50,
              child: Container(
                height: DeviceUtils.getScreenHeight(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      Assets.LEFTOW,
                      width: 100,
                      height: 100,
                    ),
                    HorizontalGap(8),
                    Image.asset(
                      Assets.RIGHT_ARROW,
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: DeviceUtils.getScreenHeight(context),
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: DeviceUtils.getScreenWidtht(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            child: Image.asset(
                              Assets.BACK_BUTTON,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        CustomText(
                            isAnyBluetoothConnected
                                ? "Connected"
                                : "Not Connected",
                            TextStyle(
                                color: isAnyBluetoothConnected
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.w600)),
                        InkWell(
                          onTap: onTapBluetoothIcon,
                          child: Image.asset(
                            Assets.BLUETOOTH_SIGN,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalGap(12),
                  getCenterLayout(subCategoryDetail.title),
                ],
              ),
            ),
          ),
          Positioned(
            child: FadeTransition(
              opacity: _animationController,
              child: Image.asset(
                isAnyBluetoothConnected ? Assets.GREEN_DOT : Assets.RED_DOT,
                height: 25,
                width: 25,
              ),
            ),
            top: 32,
            right: 150,
          ),
          Positioned(
            left: 80,
            top: 10,
            child: getSwitchForObstacleAvoider(),
          )
        ],
      ),
    );
  }

  void onRedSliderChange(double val) {
    setState(() {
      redSliderValue = val;
    });
  }

  void onGreenSliderChange(double val) {
    setState(() {
      greenSliderValue = val;
    });
  }

  void onBlueSliderChange(double val) {
    setState(() {
      blueSliderValue = val;
    });
  }

  Widget getCenterLayout(String gameName) {
    if (gameName == SubCategoryData.FREE_RUN)
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText("RED:- ${redSliderValue.round()}",
              TextStyle(color: Colors.black, fontSize: 14)),
          Container(
            width: DeviceUtils.getScreenWidtht(context) * 0.30,
            child: Slider(
              value: redSliderValue,
              onChanged: onRedSliderChange,
              max: 255,
              label: redSliderValue.round().toString(),
              divisions: 255,
              thumbColor: Colors.grey,
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
          ),
          CustomText("GREEN:- ${greenSliderValue.round()}",
              TextStyle(color: Colors.black, fontSize: 14)),
          Container(
            width: DeviceUtils.getScreenWidtht(context) * 0.30,
            child: Slider(
              value: greenSliderValue,
              onChanged: onGreenSliderChange,
              max: 255,
              label: greenSliderValue.round().toString(),
              divisions: 255,
              thumbColor: Colors.grey,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
          ),
          CustomText("BLUE:- ${blueSliderValue.round()}",
              TextStyle(color: Colors.black, fontSize: 14)),
          Container(
            width: DeviceUtils.getScreenWidtht(context) * 0.30,
            child: Slider(
              value: blueSliderValue,
              onChanged: onBlueSliderChange,
              max: 255,
              label: blueSliderValue.round().toString(),
              divisions: 255,
              thumbColor: Colors.grey,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
          ),
          Image.asset(
            Assets.CAR_HORN_OFF,
            height: 80,
            width: 110,
          )
        ],
      );
    else if (gameName == SubCategoryData.THOR_HAMMER ||
        gameName == SubCategoryData.SOCCER) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.SOCCER,
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ),
            VerticalGap(12),
            Image.asset(Assets.THOR_HAMMER,
                height: 120, width: 120, fit: BoxFit.fill),
          ],
        ),
      );
    } else if (gameName == SubCategoryData.OBSTACLE_AVOIDER) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                "OUTPUT:- ",
                const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            VerticalGap(8),
            CustomText(
                "Distance:- ",
                const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            VerticalGap(8),
            CustomText(
                "Set Ultrasonic value:- ",
                const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            VerticalGap(16),
            Container(
              width: DeviceUtils.getScreenWidtht(context) * 0.30,
              child: Slider(
                value: ultrasonicValue,
                onChanged: onUltrasonicValueChange,
                max: 255,
                label: ultrasonicValue.round().toString(),
                divisions: 255,
                thumbColor: Colors.grey,
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
              ),
            ),
            VerticalGap(8),
            Container(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {}, child: Center(child: Text("Set"))))
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void onUltrasonicValueChange(double val) {
    setState(() {
      ultrasonicValue = val;
    });
  }

  Widget getSwitchForObstacleAvoider() {
    return Container(
      child: Row(
        children: [
          CustomText("Manual", TextStyle(color: Colors.black, fontSize: 12)),
          HorizontalGap(4),
          Switch(
              value: ultrasonicSwitchValue,
              onChanged: switchForObstacleAvoiderChange,
              activeColor: Colors.white70,
              activeTrackColor: Colors.green),
          HorizontalGap(4),
          CustomText("Automatic", TextStyle(color: Colors.black, fontSize: 12))
        ],
      ),
    );
  }

  void switchForObstacleAvoiderChange(bool val) {
    setState(() {
      ultrasonicSwitchValue = val;
    });
  }

  void onTapBluetoothIcon() {
    //call alert dialog if android device to choose the device bluetooth.
    if (io.Platform.isAndroid) {
      //show chooser option
      showAlertMessage(
          "select the bluetooth connected with your device?", context);
    } else {
      // for ios directly call the ble
      onSelectBle();
    }
  }

  void showAlertMessage(String message, BuildContext context) {
    if (isAnyBluetoothConnected) {
      showAlertOkayMessage(
          "You want to connect new device previous connection will lost? ",
          onOkayPressed);
      return;
    }
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
                onSelectBle();
              },
              child: Container(
                color: Colors.deepPurple,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "BLE",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                onSelectNonBle();
              },
              child: Container(
                color: Colors.deepPurple,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "NON-BLE",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  void onSelectBle() {
    bleConnect = BleConnectivity();
    bleConnect!.askRuntimePermissions(
        context, pushScanResult, showBottomDialog, connectBleDevice);
  }

  void onSelectNonBle() {
    connectivity = ArduinoSerialConnectivity(onNondBleConnectvity);
    connectivity!.start(context);
  }

  void onNondBleConnectvity(bool value) {
    setState(() {
      isAnyBluetoothConnected = value;
      ifSerialConnected = value;
    });
  }

  void onOkayPressed() {
    print("inside on okeypressed");
    if (isAnyBluetoothConnected) {
      if (ifSerialConnected) {
        connectivity!.disconnecToBluetooth();
      }
    }
  }

  void showBottomDialog() {
    showModalBottomSheet(
        constraints: BoxConstraints(maxWidth: 300, minHeight: 100),
        context: context,
        builder: (context) {
          return Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(Dimensions.size_8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.size_10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (getButtonText(list[index]) ==
                                    "Disconnect") {
                                  bleConnect!
                                      .disconnectToBluetooth(list[index]);
                                } else {
                                  bleConnect!.connectToBluetooth(list[index]);
                                }
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 100,
                                  child: CustomText(
                                    getButtonText(list[index]),
                                    ButtonStyles.getButtonTextStyle(),
                                    textAlign: TextAlign.center,
                                  ))),
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

  void pushScanResult(ScanResult r) {
    print("inside push result");

    setState(() {
      list.add(r);
    });
  }

  String getButtonText(ScanResult r) {
    String st = "Connect";
    if (scanResult != null) {
      if (scanResult!.device.id.id == r.device.id.id) {
        if (ifBleConnected) {
          return "Disconnect";
        }
      }
    }
    return st;
  }

  void connectBleDevice(BluetoothDeviceState state, ScanResult result) {
    this.scanResult = result;
    if (state == BluetoothDeviceState.connected) {
      setState(() {
        isAnyBluetoothConnected = true;
        ifBleConnected = true;
      });
    } else if (state == BluetoothDeviceState.disconnected) {
      setState(() {
        isAnyBluetoothConnected = false;
        ifBleConnected = false;
      });
    }
  }
}
