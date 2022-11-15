import 'dart:io' as io;
import 'dart:typed_data';

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
  double dumpValue = 0;
  bool isHorn = false;

  double exacavtorSwingValue = 0;
  double exacavtorBucketValue = 0;
  double exacavtorBoomValue = 0;
  double exacavtorArmValue = 0;

  late AnimationController _animationController;
  bool ultrasonicSwitchValue = false;
  bool forkLiftSwap = false;
  bool craneLiftSwap = false;
  bool craneSwingSwap = false;
  bool catapultSwap = false;
  bool ballShooterSwap = false;

  bool armyTankShootSwap = false;
  bool armyTankSwingSwap = false;

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
      child: SingleChildScrollView(
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
                      InkWell(
                        onTapDown: (event) {
                          writeToBLuetooth([0XB0]);
                        },
                        onTapUp: (event) {
                          writeToBLuetooth([0XB4]);
                        },
                        child: Image.asset(
                          Assets.UP_ARROW,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      VerticalGap(32),
                      InkWell(
                        onTapDown: (event) {
                          writeToBLuetooth([0XB1]);
                        },
                        onTapUp: (event) {
                          writeToBLuetooth([0XB4]);
                        },
                        child: Image.asset(
                          Assets.DOWN_ARROW,
                          width: 100,
                          height: 100,
                        ),
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
                      InkWell(
                        onTapDown: (event) {
                          writeToBLuetooth([0XB2]);
                        },
                        onTapUp: (event) {
                          writeToBLuetooth([0XB4]);
                        },
                        child: Image.asset(
                          Assets.LEFTOW,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      HorizontalGap(8),
                      InkWell(
                        onTapDown: (event) {
                          writeToBLuetooth([0XB3]);
                        },
                        onTapUp: (event) {
                          writeToBLuetooth([0XB4]);
                        },
                        child: Image.asset(
                          Assets.RIGHT_ARROW,
                          width: 100,
                          height: 100,
                        ),
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
                              onOkayPressed();
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              child: Image.asset(
                                Assets.BACK_BUTTON,
                                height: 30,
                                width: 30,
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          InkWell(
                            onTap: onTapBluetoothIcon,
                            child: Image.asset(
                              Assets.BLUETOOTH_SIGN,
                              height: 30,
                              width: 30,
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
            (subCategoryDetail.title == SubCategoryData.OBSTACLE_AVOIDER)
                ? Positioned(
                    left: 80,
                    top: 10,
                    child: getSwitchForObstacleAvoider(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  void onRedSliderChange(double val) {
    setState(() {
      redSliderValue = val;
    });
    writeToBLuetooth([0XC2, val.toInt()]);
  }

  void onGreenSliderChange(double val) {
    setState(() {
      greenSliderValue = val;
    });
    writeToBLuetooth([0XC3, val.toInt()]);
  }

  void onBlueSliderChange(double val) {
    setState(() {
      blueSliderValue = val;
    });
    writeToBLuetooth([0XC4, val.toInt()]);
  }

  Widget getCenterLayout(String gameName) {
    if (gameName == SubCategoryData.FREE_RUN &&
        subCategoryDetail.mainCategoryTitle == CategoryData.ACCELEREO)
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText("RED:- ${redSliderValue.round()}",
              TextStyle(color: Colors.black, fontSize: 12)),
          Container(
            width: DeviceUtils.getScreenWidtht(context) * 0.30,
            child: Slider(
              onChanged: (val) {},
              value: redSliderValue,
              onChangeEnd: onRedSliderChange,
              max: 255,
              label: redSliderValue.round().toString(),
              divisions: 255,
              thumbColor: Colors.grey,
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
          ),
          CustomText("GREEN:- ${greenSliderValue.round()}",
              TextStyle(color: Colors.black, fontSize: 12)),
          Container(
            width: DeviceUtils.getScreenWidtht(context) * 0.30,
            child: Slider(
              onChanged: (val) {},
              value: greenSliderValue,
              onChangeEnd: onGreenSliderChange,
              max: 255,
              label: greenSliderValue.round().toString(),
              divisions: 255,
              thumbColor: Colors.grey,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
          ),
          CustomText("BLUE:- ${blueSliderValue.round()}",
              TextStyle(color: Colors.black, fontSize: 12)),
          Container(
            width: DeviceUtils.getScreenWidtht(context) * 0.30,
            child: Slider(
              value: blueSliderValue,
              onChanged: (val) {},
              onChangeEnd: onBlueSliderChange,
              max: 255,
              label: blueSliderValue.round().toString(),
              divisions: 255,
              thumbColor: Colors.grey,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isHorn = !isHorn;
              });
              if (isHorn) {
                writeToBLuetooth([0XC0]);
              } else {
                writeToBLuetooth([0XC1]);
              }
            },
            child: Image.asset(
              isHorn ? Assets.CAR_HORN_ON : Assets.CAR_HORN_OFF,
              height: 60,
              width: 110,
            ),
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
            InkWell(
              onTap: () {
                writeToBLuetooth([0XBC, 80]);
                Future.delayed(Duration(milliseconds: 3000), () {
                  writeToBLuetooth([0XBC, 0]);
                  Future.delayed(Duration(milliseconds: 3000), () {
                    writeToBLuetooth([0XBC, 80]);
                  });
                });
              },
              child: Image.asset(
                Assets.SOCCER,
                height: 120,
                width: 120,
                fit: BoxFit.fill,
              ),
            ),
            VerticalGap(12),
            InkWell(
              onTap: () {
                writeToBLuetooth([0XBB, 0]);
                Future.delayed(Duration(milliseconds: 3000), () {
                  writeToBLuetooth([0XBB, 90]);
                  Future.delayed(Duration(milliseconds: 3000), () {
                    writeToBLuetooth([0XBB, 0]);
                  });
                });
              },
              child: Image.asset(Assets.THOR_HAMMER,
                  height: 120, width: 120, fit: BoxFit.fill),
            ),
          ],
        ),
      );
    } else if (gameName == SubCategoryData.OBSTACLE_AVOIDER ||
        gameName == SubCategoryData.EDGE_DETECTOR ||
        gameName == SubCategoryData.OBSTACLE_AVOIDER) {
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
    } else if (gameName == SubCategoryData.DUMPER) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                "Dump",
                TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            VerticalGap(8),
            Container(
              width: DeviceUtils.getScreenWidtht(context) * 0.30,
              child: Slider(
                value: dumpValue,
                onChanged: onDumpValueChange,
                max: 50,
                divisions: 50,
                thumbColor: Colors.grey,
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
              ),
            )
          ],
        ),
      );
    } else if (gameName == SubCategoryData.FORKLIFT) {
      return Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Swap",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Switch(
                    value: forkLiftSwap,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        forkLiftSwap = val;
                      });
                    })
              ],
            ),
            VerticalGap(16),
            InkWell(
              onTapDown: (event) {
                if (forkLiftSwap) {
                  writeToBLuetooth([0XB6]);
                } else {
                  writeToBLuetooth([0XB5]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XB7]);
              },
              child: InkWell(
                onTapDown: (event) {
                  if (forkLiftSwap) {
                    writeToBLuetooth([0XB5]);
                  } else {
                    writeToBLuetooth([0XB6]);
                  }
                },
                onTapUp: (event) {
                  writeToBLuetooth([0XB7]);
                },
                child: Image.asset(
                  Assets.LIFT,
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            VerticalGap(16),
            Image.asset(
              Assets.DROP,
              height: 80,
              width: 80,
            ),
          ],
        )),
      );
    } else if (gameName == SubCategoryData.CRANE) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Swap(Lift)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Switch(
                    value: craneLiftSwap,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        craneLiftSwap = val;
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Swap(Swing)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Switch(
                    value: craneSwingSwap,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        craneSwingSwap = val;
                      });
                    })
              ],
            ),
            VerticalGap(16),
            InkWell(
              onTapDown: (event) {
                if (craneSwingSwap) {
                  writeToBLuetooth([0XB9]);
                } else {
                  writeToBLuetooth([0XB8]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XBA]);
              },
              child: Image.asset(
                Assets.LIFT,
                height: 50,
                width: 50,
              ),
            ),
            VerticalGap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTapDown: (event) {
                    if (craneLiftSwap) {
                      writeToBLuetooth([0XB5]);
                    } else {
                      writeToBLuetooth([0XB6]);
                    }
                  },
                  onTapUp: (event) {
                    writeToBLuetooth([0XB7]);
                  },
                  child: Image.asset(
                    Assets.SWING_LEFT,
                    height: 50,
                    width: 50,
                  ),
                ),
                HorizontalGap(16),
                InkWell(
                  onTapDown: (event) {
                    if (craneLiftSwap) {
                      writeToBLuetooth([0XB6]);
                    } else {
                      writeToBLuetooth([0XB5]);
                    }
                  },
                  onTapUp: (event) {
                    writeToBLuetooth([0XB7]);
                  },
                  child: Image.asset(
                    Assets.SWING_RIGHT,
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            VerticalGap(8),
            InkWell(
              onTapDown: (event) {
                if (craneSwingSwap) {
                  writeToBLuetooth([0XB8]);
                } else {
                  writeToBLuetooth([0XB9]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XBA]);
              },
              child: Image.asset(
                Assets.DROP,
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
      );
    } else if (gameName == SubCategoryData.CATAPULT) {
      return Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Swap",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Switch(
                    value: catapultSwap,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        catapultSwap = val;
                      });
                    })
              ],
            ),
            VerticalGap(16),
            InkWell(
              onTapDown: (event) {
                if (catapultSwap) {
                  writeToBLuetooth([0XB6]);
                } else {
                  writeToBLuetooth([0XB5]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XB7]);
              },
              child: Image.asset(
                Assets.THROW,
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
            VerticalGap(16),
            InkWell(
              onTapDown: (event) {
                if (catapultSwap) {
                  writeToBLuetooth([0XB5]);
                } else {
                  writeToBLuetooth([0XB6]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XB7]);
              },
              child: Image.asset(
                Assets.RELOAD,
                height: 80,
                width: 80,
              ),
            ),
          ],
        )),
      );
    } else if (gameName == SubCategoryData.BALL_SHOOTER) {
      return Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Swap",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Switch(
                    value: ballShooterSwap,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        ballShooterSwap = val;
                      });
                    })
              ],
            ),
            VerticalGap(16),
            InkWell(
              onTapDown: (event) {
                if (ballShooterSwap) {
                  writeToBLuetooth([0XB6]);
                } else {
                  writeToBLuetooth([0XB5]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XB7]);
              },
              child: Image.asset(
                Assets.SHOOOT,
                height: 80,
                width: 80,
              ),
            ),
            VerticalGap(16),
            InkWell(
              onTapDown: (event) {
                if (ballShooterSwap) {
                  writeToBLuetooth([0XB5]);
                } else {
                  writeToBLuetooth([0XB6]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XB7]);
              },
              child: Image.asset(
                Assets.RELOAD,
                height: 80,
                width: 80,
              ),
            ),
          ],
        )),
      );
    } else if (gameName == SubCategoryData.EXCAVATOR) {
      return Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Swing",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Container(
              width: DeviceUtils.getScreenWidtht(context) * 0.30,
              child: Slider(
                value: exacavtorSwingValue,
                onChanged: (val) {
                  setState(() {
                    exacavtorSwingValue = val;
                  });
                  writeToBLuetooth([0XBB, val.toInt()]);
                },
                max: 180,
                divisions: 180,
                thumbColor: Colors.grey,
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
              ),
            ),
            Text("Bucket",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Container(
              width: DeviceUtils.getScreenWidtht(context) * 0.30,
              child: Slider(
                value: exacavtorBucketValue,
                onChanged: (val) {
                  setState(() {
                    exacavtorBucketValue = val;
                  });
                  writeToBLuetooth([0XBC, val.toInt()]);
                },
                max: 180,
                divisions: 180,
                thumbColor: Colors.grey,
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
              ),
            ),
            Text("Boon",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Container(
              width: DeviceUtils.getScreenWidtht(context) * 0.30,
              child: Slider(
                value: exacavtorBoomValue,
                onChanged: (val) {
                  setState(() {
                    exacavtorBoomValue = val;
                  });
                  writeToBLuetooth([0XBD, val.toInt()]);
                },
                max: 180,
                divisions: 180,
                thumbColor: Colors.grey,
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
              ),
            ),
            Text("Arm",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Container(
              width: DeviceUtils.getScreenWidtht(context) * 0.30,
              child: Slider(
                value: exacavtorArmValue,
                onChanged: (val) {
                  setState(() {
                    exacavtorArmValue = val;
                  });
                  writeToBLuetooth([0XBE, val.toInt()]);
                },
                max: 180,
                divisions: 180,
                thumbColor: Colors.grey,
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
              ),
            )
          ],
        )),
      );
    } else if (gameName == CategoryData.ARNY_TANK) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Swap(Shoot)",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Switch(
                    value: armyTankShootSwap,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        armyTankShootSwap = val;
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Swap(Swing)",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                Switch(
                    value: armyTankSwingSwap,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        armyTankSwingSwap = val;
                      });
                    })
              ],
            ),
            InkWell(
              onTapDown: (event) {
                if (armyTankShootSwap) {
                  writeToBLuetooth([0XB9]);
                } else {
                  writeToBLuetooth([0XB8]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XBA]);
              },
              child: Image.asset(
                Assets.SHOOOTER_MDPI,
                height: 60,
                width: 60,
              ),
            ),
            VerticalGap(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTapDown: (event) {
                    if (armyTankSwingSwap) {
                      writeToBLuetooth([0XB6]);
                    } else {
                      writeToBLuetooth([0XB5]);
                    }
                  },
                  onTapUp: (event) {
                    writeToBLuetooth([0XB7]);
                  },
                  child: Image.asset(
                    Assets.SWING_MDPI,
                    height: 60,
                    width: 60,
                  ),
                ),
                HorizontalGap(16),
                InkWell(
                  onTapDown: (event) {
                    if (armyTankSwingSwap) {
                      writeToBLuetooth([0XB5]);
                    } else {
                      writeToBLuetooth([0XB6]);
                    }
                  },
                  onTapUp: (event) {
                    writeToBLuetooth([0XB7]);
                  },
                  child: Image.asset(
                    Assets.SWING_MDPI_2,
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
            VerticalGap(2),
            InkWell(
              onTapDown: (event) {
                if (armyTankShootSwap) {
                  writeToBLuetooth([0XB8]);
                } else {
                  writeToBLuetooth([0XB9]);
                }
              },
              onTapUp: (event) {
                writeToBLuetooth([0XBA]);
              },
              child: Image.asset(
                Assets.RELOAD,
                height: 60,
                width: 60,
              ),
            ),
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

  void onDumpValueChange(double val) {
    setState(() {
      dumpValue = val;
    });
    writeToBLuetooth([0XBB, val.toInt()]);
  }

  Widget getSwitchForObstacleAvoider() {
    return Container(
      child: Row(
        children: [
          CustomText("Manual", TextStyle(color: Colors.black, fontSize: 12)),
          HorizontalGap(2),
          Switch(
              value: ultrasonicSwitchValue,
              onChanged: switchForObstacleAvoiderChange,
              activeColor: Colors.white70,
              activeTrackColor: Colors.green),
          HorizontalGap(2),
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
    bleConnect!
        .askRuntimePermissions(context, showBottomDialog, connectBleDevice);
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
      } else {
        bleConnect!.disconnectToBluetooth(scanResult!);
      }
    }
  }

  void showBottomDialog(Stream data) {
    showModalBottomSheet(
        constraints: BoxConstraints(maxWidth: 300, minHeight: 100),
        context: context,
        builder: (context) {
          return StreamBuilder(
            builder: (c, snapshot) {
              print(snapshot.connectionState.toString());
              print(snapshot.data.toString());

              if (snapshot.data != null) {
                return Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: (snapshot.data as List<ScanResult>).length,
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
                                  (snapshot.data as List<ScanResult>)[index]
                                      .device
                                      .name,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.lightGreen),
                                ),
                                HorizontalGap(10),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.all(Dimensions.size_8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.size_10),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (getButtonText((snapshot.data
                                              as List<ScanResult>)[index]) ==
                                          "Disconnect") {
                                        bleConnect!.disconnectToBluetooth(
                                            (snapshot.data
                                                as List<ScanResult>)[index]);
                                      } else {
                                        bleConnect!.connectToBluetooth((snapshot
                                            .data as List<ScanResult>)[index]);
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        width: 100,
                                        child: CustomText(
                                          getButtonText((snapshot.data
                                              as List<ScanResult>)[index]),
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
              } else {
                return Container();
              }
            },
            initialData: List<ScanResult>,
            stream: data,
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

  void writeToBLuetooth(List<int> data) {
    if (isAnyBluetoothConnected) {
      if (ifSerialConnected) {
        Uint8List list = Uint8List(data.length);
        for (int i = 0; i < data.length; i++) {
          list[i] = data[i];
        }
        connectivity!.writeToConnection(list);
      } else {
        bleConnect!.writeToBle(data);
      }
    } else {
      showToast("Bluetooth not connected");
    }
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
