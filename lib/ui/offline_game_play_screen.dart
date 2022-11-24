import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/connectivity/offline_udp_connectivity.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/data/shared_preference/my_shared_preference.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/models/offline_data.dart';
import 'package:neeraj_flutter_app/ui/smart_lamp_category_screen.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/custom_text_field.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';

///Created by Naman Gupta on 15/11/22.

class OfflineGamePlayScreen extends StatefulWidget {
  late OfflineSubCategoryDetail data;

  OfflineGamePlayScreen(this.data);

  @override
  State<StatefulWidget> createState() {
    return OfflineGamePlayScreenState(this.data);
  }
}

class OfflineGamePlayScreenState extends BaseClass {
  late OfflineSubCategoryDetail data;

  OfflineGamePlayScreenState(this.data);

  double dustbinSensingSliderValue = 0;
  double dustbinOpenPeriodSliderValue = 0;

  double ironManRedSliderValue = 0;
  double ironManGreenSliderValue = 0;
  double ironManBlueSliderValue = 0;

  double smartIrrigationDryThresholdValue = 0;
  double smartIrrigationDispencePeriodValue = 0;

  double smartAlarmDarknessThresholdValue = 0;
  double smartSensingDistanceAlarmValue = 0;

  double burglarAlarmValue = 0;

  double soapDisSensindDistanceValue = 0;
  double soapDisDispnecePeriodValue = 1;

  double petFeederSensingValue = 0;
  double petFeederOpenValue = 1;

  double touchlessDorbellValue = 1;

  double lightBasedDarknessValue = 0;
  double lightBasedRedValue = 0;
  double lightBasedGreenValue = 0;
  double lightBasedBlueValue = 0;

  double gestureBasedDarknessValue = 0;
  double gestureBasedRedValue = 0;
  double gestureBasedGreenValue = 0;
  double gestureBasedBlueValue = 0;

  double clapBasedDarknessValue = 0;
  double clapBasedRedValue = 0;
  double clapBasedGreenValue = 0;
  double clapBasedBlueValue = 0;

  double mobileControlledDarknessValue = 0;
  double mobileControlledRedValue = 0;
  double mobileControlledGreenValue = 0;
  double mobileControlledBlueValue = 0;

  double switchControlledRedValue = 0;
  double switchControlledGreenValue = 0;
  double switchControlledBlueValue = 0;

  bool applianceSwitchValue = false;
  bool isOnPressedAppliance = false;
  bool isOffPressedAppliance = false;
  bool smartDustbinSwitchValue = false;
  bool ironManSwitchValue = false;
  bool smartIrrigationSwitchValue = false;
  bool smartAlarmSwitchValue = false;
  bool burglarAlarmSwitchValue = false;
  bool soapDispencerSwitchValue = false;
  bool petFeederSwitchValue = false;
  bool airGuitarSwitchValue = false;
  bool touchlessDorbellSwitchValue = false;
  bool lightBasedSwitchValue = false;
  bool gestureBasedSwitchValue = false;
  bool switchControlledSwitchValue = false;
  bool clapBasedSwitchValue = false;
  bool mobileControlledSwitchValue = false;

  late TextEditingController dancingDollWifiName;
  late UdpConnectivity? connectivity;

  @override
  void initState() {
    connectivity = UdpConnectivity();
    connectivity!.start(context);
    loadPrefsValues();
    super.initState();

    dancingDollWifiName = TextEditingController();
  }

  void loadPrefsValues() async {
    smartDustbinSwitchValue = await MySharedPreference.getSmartDustbinSwitch();
    dustbinSensingSliderValue =
        await MySharedPreference.getSmartDustbinSensing();
    dustbinOpenPeriodSliderValue =
        await MySharedPreference.getSmartDustbinOpen();

    ironManSwitchValue =
        await MySharedPreference.getBoolean(MySharedPreference.IRONMAN_SWITCH);
    ironManRedSliderValue =
        await MySharedPreference.getDouble(MySharedPreference.IRONMAN_RED);
    ironManGreenSliderValue =
        await MySharedPreference.getDouble(MySharedPreference.IRONMAN_GREEN);
    ironManBlueSliderValue =
        await MySharedPreference.getDouble(MySharedPreference.IRONMAN_BLUE);
    smartIrrigationSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.SMART_IRRIGATION_SWITCH);
    smartIrrigationDryThresholdValue = await MySharedPreference.getDouble(
        MySharedPreference.SMART_IRRIGATION_THRESHOLD);
    smartIrrigationDispencePeriodValue = await MySharedPreference.getDouble(
        MySharedPreference.SMART_IRRIGATION_DISPENSE);
    smartAlarmSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.SMART_ALARM_SWITCH);
    smartSensingDistanceAlarmValue = await MySharedPreference.getDouble(
        MySharedPreference.SMART_ALARM_DISTANCE);
    smartAlarmDarknessThresholdValue = await MySharedPreference.getDouble(
        MySharedPreference.SMART_ALARM_DARKNESS);
    burglarAlarmSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.BURGLAR_ALARM_SWITCH);
    burglarAlarmValue = await MySharedPreference.getDouble(
        MySharedPreference.BURGLAR_ALARM_DISTANCE);
    soapDispencerSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.SOAP_DISPENSER_SWITCH);
    soapDisSensindDistanceValue = await MySharedPreference.getDouble(
        MySharedPreference.SOAP_DISPENSER_DISTANCE);
    soapDisDispnecePeriodValue = await MySharedPreference.getDouble(
        MySharedPreference.SOAP_DISPENSER_PERIOD);
    petFeederSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.PET_FEDDER_SWITCH);
    petFeederSensingValue = await MySharedPreference.getDouble(
        MySharedPreference.PET_FEDDER_DISTANCE);
    petFeederOpenValue = await MySharedPreference.getDouble(
        MySharedPreference.PET_FEDDER_PERIOD);
    airGuitarSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.AIRGUITAR_SWITCH);
    touchlessDorbellValue =
        await MySharedPreference.getDouble(MySharedPreference.DOORBELL_VALUE);
    touchlessDorbellSwitchValue =
        await MySharedPreference.getBoolean(MySharedPreference.DOORBELL_SWITCH);
    lightBasedSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.LIGHTBASED_SWITCH);
    lightBasedDarknessValue = await MySharedPreference.getDouble(
        MySharedPreference.LIGHTBASED_DARKNEDD);
    lightBasedRedValue =
        await MySharedPreference.getDouble(MySharedPreference.LIGHTBASED_RED);
    lightBasedGreenValue =
        await MySharedPreference.getDouble(MySharedPreference.LIGHTBASED_GREEN);
    lightBasedBlueValue =
        await MySharedPreference.getDouble(MySharedPreference.LIGHTBASED_BLUE);
    gestureBasedSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.GESTUREBASED_SWITCH);
    gestureBasedDarknessValue = await MySharedPreference.getDouble(
        MySharedPreference.GESTUREBASED_DARKNEDD);
    gestureBasedRedValue =
        await MySharedPreference.getDouble(MySharedPreference.GESTUREBASED_RED);
    gestureBasedGreenValue = await MySharedPreference.getDouble(
        MySharedPreference.GESTUREBASED_GREEN);
    gestureBasedBlueValue = await MySharedPreference.getDouble(
        MySharedPreference.GESTUREBASED_BLUE);

    switchControlledSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.SWITCHBASED_SWITCH);
    switchControlledRedValue =
        await MySharedPreference.getDouble(MySharedPreference.SWITCHBASED_RED);
    switchControlledGreenValue = await MySharedPreference.getDouble(
        MySharedPreference.SWITCHBASED_GREEN);
    switchControlledBlueValue =
        await MySharedPreference.getDouble(MySharedPreference.SWITCHBASED_BLUE);

    clapBasedSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.CLAPBASED_SWITCH);
    clapBasedDarknessValue = await MySharedPreference.getDouble(
        MySharedPreference.CLAPBASED_DARKNEDD);
    clapBasedRedValue =
        await MySharedPreference.getDouble(MySharedPreference.CLAPBASED_RED);
    clapBasedGreenValue =
        await MySharedPreference.getDouble(MySharedPreference.CLAPBASED_GREEN);
    clapBasedBlueValue =
        await MySharedPreference.getDouble(MySharedPreference.CLAPBASED_BLUE);
    mobileControlledSwitchValue = await MySharedPreference.getBoolean(
        MySharedPreference.MOBILEBASED_SWITCH);
    mobileControlledRedValue =
        await MySharedPreference.getDouble(MySharedPreference.MOBILEBASED_RED);
    mobileControlledGreenValue = await MySharedPreference.getDouble(
        MySharedPreference.MOBILEBASED_GREEN);
    mobileControlledBlueValue =
        await MySharedPreference.getDouble(MySharedPreference.MOBILEBASED_BLUE);

    setState(() {});
  }

  @override
  Widget? setBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: DeviceUtils.getScreenHeight(context),
      width: DeviceUtils.getScreenWidtht(context),
      color: Colors.pinkAccent,
      child: SingleChildScrollView(
        child: Container(
          height: DeviceUtils.getScreenHeight(context),
          width: DeviceUtils.getScreenWidtht(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
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
                  HorizontalGap(50),
                  CustomText(
                      data.title,
                      TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: textLayout()),
                    Expanded(
                      child: getRightLayout(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textLayout() {
    return Container(
      padding: EdgeInsets.all(8),
      width: DeviceUtils.getScreenWidtht(context) * 0.40,
      color: Colors.grey,
      child: CustomText(
          getLeftText(), TextStyle(color: Colors.white, fontSize: 14)),
    );
  }

  String getLeftText() {
    String text =
        "Control the AC Appliances like Desk Lamp, Night Lamp, Tanle Fan or any other small appliance using the app. \n Circuit Blocks nedded - Relay and RGB LED Connections with CPU - \n Relay at Port 1 \n RGB LED at Port 3";
    switch (data.title) {
      case OfflineSubCategoryData.APPLIANCE_CONTROL:
        text =
            "Control the AC Appliances like Desk Lamp, Night Lamp, Tanle Fan or any other small appliance using the app. \nCircuit Blocks nedded - Relay and RGB LED Connections with CPU - \nRelay at Port 1 \nRGB LED at Port 3";
        break;
      case OfflineSubCategoryData.SMART_DUSTBIN:
        text =
            "Put the trash inside the Dustbin without touching it, just by placing your hand in front of the sensor.\nCircuit blocks needed-Servo driver and sonar sensor \nConnection with CPU- \nServo driver at Port 3 \nSONAR Sensor at Port 1";
        break;
      case OfflineSubCategoryData.IRON_MAN_HAND:
        text =
            "Get the experience of wearing a replica of Iron Man hand glow when raised. \nCircuit Blocks Needed-RGB LED and Motion Sensor \nConnections with CPU- \nRGB LED at Port 3 \nMotion Sensor at Port 1";
        break;
      case OfflineSubCategoryData.SMART_IRRIGATION:
        text =
            "The plant will automatically get the water when it gets dry. \nSelect the Moist Percentage below which the soil will be treated as Dry \nCircuit Blocks Needed-Pump Driver and Moist Sensor \nConnection with CPU- \nPump Driver at port 3 \nMoist Sensor at Port 2";
        break;
      case OfflineSubCategoryData.SOAP_DISPENSOR:
        text =
            "Place hand below the sensor and the machine will automatically dispense the liquid \nCircuit Blocks Nedded-Pump Driver and Sonar Sensor \nConnections with CPU- \nPump Driver at Port 3 \nSONAR Sensor at Port 1";
        break;
      case OfflineSubCategoryData.PET_FEEDER:
        text =
            "The pet will automatically get the food when it gets near the food tray.The sensor senses the presence and release the food.\nCircuit Blocks Needed-Servo Driver and SONAR Sensor\nConnections with CPU-\nServo Driver at Port 3 \nSONAR sensor at Port1";
        break;
      case OfflineSubCategoryData.AIR_GUITAR:
        text =
            "Try the innovative way of playing the guitar tunes in the air using the sensor.\nCircuit Blocks Needed-Buzzer and SONAR sensor\nConnections with CPU-Buzzer at Port 3 \nSONAR Sensor at Port 1";
        break;
      case OfflineSubCategoryData.SMART_ALARM:
        text =
            "Place the alarm near the window from where sunlight is coming. the alarm will be raised when there is light and will get off when you get in front of it.\nCircuit Blocks Needed-Light Sensor and SONAR Sensor \nConnections with CPU-\nLight Sensor at Port 2\nSONAR Sensor at Port1";
        break;
      case OfflineSubCategoryData.BURGLAR_ALARM:
        text =
            "Place the structure near a door to detect the presence of a person coming in. Raise the alarm when a person is detected.\nCircuit Blocks Needed-\nBuzzer at Port 3 \nSONAR Sensor at Port1";
        break;
      case OfflineSubCategoryData.MAGIC_DANCING_DOLL:
        text =
            "Prepare the structure of the Magic Wand.\nConnect Motion Sensor at Port 1.\nConnect servo driver at Port 3. use Servo1 and Servo2 for the dolls.\nConnect the app with the wifi dolls CPU.\nEnter the wifi name of the Magic Wand CPU, so that the wand and dolls can pe paired.\nReset the hardware to get back to normal functioning.";
        break;
      case OfflineSubCategoryData.PERSON_COUNTER:
        text =
            "Place the structure near a door to detect the presence of a person coming in the room.\nCircuit Blocks Needed-SONAR Sensor and RGB LED\nConnections with CPU-\nRGB LED at Port 3 \nSONAR Sensor at Port 1";
        break;

      case OfflineSubCategoryData.TOUCHLESS_DOORBELL:
        text =
            "Place the hand in front of the sensor to ring the bell.\nCircuit Blocks Needed-Proximity Sensor and Buzzer\nConnections with CPU-\nBuzzer at Port 3 \nProximty Sensor at Port 2";
        break;
      case OfflineSubCategoryData.IOT_CLOUD:
        break;
      case OfflineSubCategoryData.BUZZER:
        break;
      case OfflineSubCategoryData.AC_RELAY:
        break;
      case OfflineSubCategoryData.SERVO_DRIVER:
        break;
      case OfflineSubCategoryData.RGB_LED:
        break;

      case OfflineSubCategoryData.PUMP_DRIVER:
        break;
      case OfflineSubCategoryData.MOTOR_DRIVER:
        break;
      case OfflineSubCategoryData.PRXIMITY_SENSOR:
        break;
      case OfflineSubCategoryData.WEATHOR_SENSOR:
        break;
      case OfflineSubCategoryData.SOUND_SENSOR:
        break;
      case OfflineSubCategoryData.MOTION_SENSOR:
        break;
      case OfflineSubCategoryData.ULTRASONIC_SENSOR:
        break;
      case OfflineSubCategoryData.SOIL_MOISTURE_SENSOR:
        break;
      case OfflineSubCategoryData.LIGHT_SENSOR:
        break;
      case OfflineSubCategoryData.PUSH_SWITCH:
        break;
      case SmartLampDetailData.LIGHT_SENSOR_BASED:
        text =
            "Control the brightness of the lamp according to the natural light in the room. the lamp will get on when it's dark inside and will act as a night lamp.\nSelect the light intensity percentage below which there will be darkness.\nCircuit Blocks Needed-RGB LED and Light Sensor\nConnections with CPU-\nRGB LED at Port 3\nLight Sensor at Port 2";

        break;

      case SmartLampDetailData.GESTURE_BASED:
        text =
            "Wave the hand in front of the sensor to switch the lamp on/off.\nSelect the RLI percentage above which it will  be taken as Gesture.\nCircuit Blocks Needed-RGB LED and Proximity Sensor\nConnections with CPU-\nRGB LED at Port 3\nProximity Sensor at Port 2";
        break;
      case SmartLampDetailData.SWITCH_CONTROLLED:
        text =
            "Control the colour of the lamp from the push switch.\nCircuit Blocks Needed-RGB LED and Push Switch\nConnection with CPU-RGB LED at Port 3\nPush Switch at Port 1";
        break;
      case SmartLampDetailData.CLAP_BASED:
        text =
            "Control the switching of the lamp with a clap.\nSelect the noise level percentage above which it will be taken as a clap.\nCircuit Blocks Needed-RGB LED and Light\nConnection with CPU-\nRGB LED at Port 3\nSound Sensor at Port 2";
        break;
      case SmartLampDetailData.MOBILE_CONTROLLED:
        text =
            "Control the colour and brightness of the lamp from the app.\nCircuit Blocks Needed-RGB LED and Proximity Sensor\nConnection with CPU-RGB LED at Port 3";
        break;
    }

    return text;
  }

  Widget getRightLayout() {
    if (data.title == OfflineSubCategoryData.APPLIANCE_CONTROL)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
            value: applianceSwitchValue,
            onChanged: (bool val) {
              setState(() {
                applianceSwitchValue = val;
              });
              if (!val) {
                connectivity!.sendData([0XE2]);
              }
            },
            activeTrackColor: Colors.yellow,
            activeColor: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: applianceSwitchValue
                    ? null
                    : () async {
                        bool isSend = false;
                        if (!isOnPressedAppliance) {
                          isSend = await connectivity!.sendData([0XC0, 1]);
                        }
                        if (isSend) {
                          setState(() {
                            if (!isOnPressedAppliance) {
                              isOffPressedAppliance = false;
                              isOnPressedAppliance = true;
                            }
                          });
                        }
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isOnPressedAppliance ? Colors.yellow : Colors.blue),
                child: Text("ON"),
              ),
              HorizontalGap(24),
              ElevatedButton(
                onPressed: applianceSwitchValue
                    ? null
                    : () async {
                        bool isSend = false;
                        if (!isOffPressedAppliance) {
                          isSend = await connectivity!.sendData([0XC0, 0]);
                        }
                        if (isSend) {
                          setState(() {
                            if (!isOffPressedAppliance) {
                              isOffPressedAppliance = true;
                              isOnPressedAppliance = false;
                            }
                          });
                        }
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isOffPressedAppliance ? Colors.yellow : Colors.blue),
                child: Text("OFF"),
              ),
            ],
          )
        ],
      );
    else if (data.title == OfflineSubCategoryData.SMART_DUSTBIN) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: smartDustbinSwitchValue,
              onChanged: (val) {
                setState(() {
                  smartDustbinSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setSmartDustbinSwitch(val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC2,
                    dustbinSensingSliderValue.toInt(),
                    dustbinOpenPeriodSliderValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setSmartDustbinSwitch(val);
                      MySharedPreference.setSmartDustbinOpen(
                          dustbinOpenPeriodSliderValue);
                      MySharedPreference.setSmartDustbinSensing(
                          dustbinSensingSliderValue);
                    }
                  });
                }
              }),
          Text("Sensing Distance (cm):- ${dustbinSensingSliderValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: dustbinSensingSliderValue,
            onChanged: smartDustbinSwitchValue
                ? null
                : (val) {
                    setState(() {
                      dustbinSensingSliderValue = val;
                    });
                  },
            label: dustbinSensingSliderValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.grey,
          ),
          Text("Open Period (100 ms):- ${dustbinOpenPeriodSliderValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: dustbinOpenPeriodSliderValue,
            onChanged: smartDustbinSwitchValue
                ? null
                : (val) {
                    setState(() {
                      dustbinOpenPeriodSliderValue = val;
                    });
                  },
            label: dustbinOpenPeriodSliderValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.grey,
          ),
        ],
      );
    } else if (data.title == OfflineSubCategoryData.IRON_MAN_HAND)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: ironManSwitchValue,
              onChanged: (val) {
                setState(() {
                  ironManSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.IRONMAN_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC4,
                    ironManRedSliderValue.toInt(),
                    ironManGreenSliderValue.toInt(),
                    ironManBlueSliderValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.IRONMAN_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.IRONMAN_RED,
                          ironManRedSliderValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.IRONMAN_GREEN,
                          ironManGreenSliderValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.IRONMAN_BLUE,
                          ironManBlueSliderValue);
                    }
                  });
                }
              }),
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(8),
            child: Text("Glow Color Selector",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
          VerticalGap(8),
          Text("RED:- ${ironManRedSliderValue.round()}"),
          Slider(
            value: ironManRedSliderValue,
            onChanged: ironManSwitchValue
                ? null
                : (val) {
                    setState(() {
                      ironManRedSliderValue = val;
                    });
                  },
            label: ironManRedSliderValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          Text("GREEN:- ${ironManGreenSliderValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: ironManGreenSliderValue,
            onChanged: ironManSwitchValue
                ? null
                : (val) {
                    setState(() {
                      ironManGreenSliderValue = val;
                    });
                  },
            label: ironManGreenSliderValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
          Text("BLUE:- ${ironManBlueSliderValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: ironManBlueSliderValue,
            onChanged: ironManSwitchValue
                ? null
                : (val) {
                    setState(() {
                      ironManBlueSliderValue = val;
                    });
                  },
            label: ironManBlueSliderValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == OfflineSubCategoryData.SMART_IRRIGATION)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: smartIrrigationSwitchValue,
              onChanged: (val) {
                setState(() {
                  smartIrrigationSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.SMART_IRRIGATION_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC6,
                    smartIrrigationDryThresholdValue.toInt(),
                    smartIrrigationDispencePeriodValue.toInt(),
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.SMART_IRRIGATION_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.SMART_IRRIGATION_THRESHOLD,
                          smartIrrigationDryThresholdValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.SMART_IRRIGATION_DISPENSE,
                          smartIrrigationDispencePeriodValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text(
              "Dry Threshold (%):- ${smartIrrigationDryThresholdValue.round()}"),
          Slider(
            value: smartIrrigationDryThresholdValue,
            onChanged: smartIrrigationSwitchValue
                ? null
                : (val) {
                    setState(() {
                      smartIrrigationDryThresholdValue = val;
                    });
                  },
            label: smartIrrigationDryThresholdValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text(
              "Dispence Period (100 ms):- ${smartIrrigationDispencePeriodValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: smartIrrigationDispencePeriodValue,
            onChanged: smartIrrigationSwitchValue
                ? null
                : (val) {
                    setState(() {
                      smartIrrigationDispencePeriodValue = val;
                    });
                  },
            label: smartIrrigationDispencePeriodValue.round().toString(),
            max: 10,
            divisions: 10,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == OfflineSubCategoryData.SMART_ALARM)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: smartAlarmSwitchValue,
              onChanged: (val) {
                setState(() {
                  smartAlarmSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.SMART_ALARM_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC7,
                    smartSensingDistanceAlarmValue.toInt(),
                    smartAlarmDarknessThresholdValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.SMART_ALARM_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.SMART_ALARM_DARKNESS,
                          smartAlarmDarknessThresholdValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.SMART_ALARM_DISTANCE,
                          smartSensingDistanceAlarmValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text(
              "Darkness Threshold (%):- ${smartAlarmDarknessThresholdValue.round()}"),
          Slider(
            value: smartAlarmDarknessThresholdValue,
            onChanged: smartAlarmSwitchValue
                ? null
                : (val) {
                    setState(() {
                      smartAlarmDarknessThresholdValue = val;
                    });
                  },
            label: smartAlarmDarknessThresholdValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text(
              "Sensing Distance (cm):- ${smartSensingDistanceAlarmValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: smartSensingDistanceAlarmValue,
            onChanged: smartAlarmSwitchValue
                ? null
                : (val) {
                    setState(() {
                      smartSensingDistanceAlarmValue = val;
                    });
                  },
            label: smartSensingDistanceAlarmValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == OfflineSubCategoryData.BURGLAR_ALARM)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: burglarAlarmSwitchValue,
              onChanged: (val) {
                setState(() {
                  burglarAlarmSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.BURGLAR_ALARM_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC9,
                    burglarAlarmValue.toInt(),
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.BURGLAR_ALARM_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.BURGLAR_ALARM_DISTANCE,
                          burglarAlarmValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("Sensing Distance (cm):- ${burglarAlarmValue.round()}"),
          Slider(
            value: burglarAlarmValue,
            onChanged: burglarAlarmSwitchValue
                ? null
                : (val) {
                    setState(() {
                      burglarAlarmValue = val;
                    });
                  },
            label: burglarAlarmValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == OfflineSubCategoryData.SOAP_DISPENSOR)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: soapDispencerSwitchValue,
              onChanged: (val) {
                setState(() {
                  soapDispencerSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.SOAP_DISPENSER_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC1,
                    soapDisSensindDistanceValue.toInt(),
                    soapDisDispnecePeriodValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.SOAP_DISPENSER_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.SOAP_DISPENSER_DISTANCE,
                          soapDisSensindDistanceValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.SOAP_DISPENSER_PERIOD,
                          soapDisDispnecePeriodValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text(
              "Sensing Distance (cm):- ${soapDisSensindDistanceValue.round()}"),
          Slider(
            value: soapDisSensindDistanceValue,
            onChanged: soapDispencerSwitchValue
                ? null
                : (val) {
                    setState(() {
                      soapDisSensindDistanceValue = val;
                    });
                  },
            label: soapDisSensindDistanceValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text(
              "Dispence Period (100 ms):- ${soapDisDispnecePeriodValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: soapDisDispnecePeriodValue,
            onChanged: soapDispencerSwitchValue
                ? null
                : (val) {
                    setState(() {
                      soapDisDispnecePeriodValue = val;
                    });
                  },
            label: soapDisDispnecePeriodValue.round().toString(),
            max: 10,
            divisions: 10,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == OfflineSubCategoryData.PET_FEEDER)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: petFeederSwitchValue,
              onChanged: (val) {
                setState(() {
                  petFeederSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.PET_FEDDER_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC3,
                    petFeederSensingValue.toInt(),
                    petFeederOpenValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.PET_FEDDER_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.PET_FEDDER_DISTANCE,
                          petFeederSensingValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.PET_FEDDER_PERIOD,
                          petFeederOpenValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("Sensing Distance (cm):- ${petFeederSensingValue.round()}"),
          Slider(
            value: petFeederSensingValue,
            onChanged: petFeederSwitchValue
                ? null
                : (val) {
                    setState(() {
                      petFeederSensingValue = val;
                    });
                  },
            label: petFeederSensingValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text("Open Period (100 ms):- ${petFeederOpenValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: petFeederOpenValue,
            onChanged: petFeederSwitchValue
                ? null
                : (val) {
                    setState(() {
                      petFeederOpenValue = val;
                    });
                  },
            label: petFeederOpenValue.round().toString(),
            max: 10,
            divisions: 10,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == OfflineSubCategoryData.AIR_GUITAR)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: airGuitarSwitchValue,
              onChanged: (val) {
                setState(() {
                  airGuitarSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.AIRGUITAR_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XC5,
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.AIRGUITAR_SWITCH, val);
                    }
                  });
                }
              }),
        ],
      );
    else if (data.title == OfflineSubCategoryData.TOUCHLESS_DOORBELL)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: touchlessDorbellSwitchValue,
              onChanged: (val) {
                setState(() {
                  touchlessDorbellSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.DOORBELL_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XCA,
                    touchlessDorbellValue.toInt(),
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.DOORBELL_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.DOORBELL_VALUE,
                          touchlessDorbellValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("RLI Threshold (%):- ${touchlessDorbellValue.round()}"),
          Slider(
            value: touchlessDorbellValue,
            onChanged: touchlessDorbellSwitchValue
                ? null
                : (val) {
                    setState(() {
                      touchlessDorbellValue = val;
                    });
                  },
            label: touchlessDorbellValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == OfflineSubCategoryData.MAGIC_DANCING_DOLL)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("wifi name:-", style: TextStyle(fontSize: 12)),
          VerticalGap(4),
          Text(
              "Enter the WiFi Name of the Magic Wand CPU, so that the Wand and Dolls can be paired.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14)),
          VerticalGap(16),
          Container(
            color: Colors.white,
            width: DeviceUtils.getScreenWidtht(context) * 0.30,
            padding: EdgeInsets.all(4),
            child: Center(
              child: CustomTextField(
                  dancingDollWifiName,
                  TextInputType.text,
                  InputDecoration(
                      border: InputBorder.none, hintText: "WiFi Name"),
                  TextStyle()),
            ),
          ),
          VerticalGap(16),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Activate",
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
              ))
        ],
      );
    else if (data.title == SmartLampDetailData.LIGHT_SENSOR_BASED)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: lightBasedSwitchValue,
              onChanged: (val) {
                setState(() {
                  lightBasedSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.LIGHTBASED_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XCD,
                    lightBasedDarknessValue.toInt(),
                    lightBasedRedValue.toInt(),
                    lightBasedGreenValue.toInt(),
                    lightBasedBlueValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.LIGHTBASED_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.LIGHTBASED_DARKNEDD,
                          lightBasedDarknessValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.LIGHTBASED_RED,
                          lightBasedRedValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.LIGHTBASED_GREEN,
                          lightBasedGreenValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.LIGHTBASED_BLUE,
                          lightBasedBlueValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("Darkness Threshold (%):- ${lightBasedDarknessValue.round()}"),
          Slider(
            value: lightBasedDarknessValue,
            onChanged: lightBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      lightBasedDarknessValue = val;
                    });
                  },
            label: lightBasedDarknessValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text("RED:- ${lightBasedRedValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: lightBasedRedValue,
            onChanged: lightBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      lightBasedRedValue = val;
                    });
                  },
            label: lightBasedRedValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          Text("GREEN:- ${lightBasedGreenValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: lightBasedGreenValue,
            onChanged: lightBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      lightBasedGreenValue = val;
                    });
                  },
            label: lightBasedGreenValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
          Text("BLUE:- ${lightBasedBlueValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: lightBasedBlueValue,
            onChanged: lightBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      lightBasedBlueValue = val;
                    });
                  },
            label: lightBasedBlueValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == SmartLampDetailData.GESTURE_BASED)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: gestureBasedSwitchValue,
              onChanged: (val) {
                setState(() {
                  gestureBasedSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.GESTUREBASED_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XCF,
                    gestureBasedDarknessValue.toInt(),
                    gestureBasedRedValue.toInt(),
                    gestureBasedGreenValue.toInt(),
                    gestureBasedBlueValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.GESTUREBASED_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.GESTUREBASED_DARKNEDD,
                          gestureBasedDarknessValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.GESTUREBASED_RED,
                          gestureBasedRedValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.GESTUREBASED_GREEN,
                          gestureBasedGreenValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.GESTUREBASED_BLUE,
                          gestureBasedBlueValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("Darkness Threshold (%):- ${gestureBasedDarknessValue.round()}"),
          Slider(
            value: gestureBasedDarknessValue,
            onChanged: gestureBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      gestureBasedDarknessValue = val;
                    });
                  },
            label: gestureBasedDarknessValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text("RED:- ${gestureBasedRedValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: gestureBasedRedValue,
            onChanged: gestureBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      gestureBasedRedValue = val;
                    });
                  },
            label: gestureBasedRedValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          Text("GREEN:- ${gestureBasedGreenValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: gestureBasedGreenValue,
            onChanged: gestureBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      gestureBasedGreenValue = val;
                    });
                  },
            label: gestureBasedGreenValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
          Text("BLUE:- ${gestureBasedBlueValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: gestureBasedBlueValue,
            onChanged: gestureBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      gestureBasedBlueValue = val;
                    });
                  },
            label: gestureBasedBlueValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == SmartLampDetailData.SWITCH_CONTROLLED)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: switchControlledSwitchValue,
              onChanged: (val) {
                setState(() {
                  switchControlledSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.SWITCHBASED_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XD1,
                    switchControlledRedValue.toInt(),
                    switchControlledGreenValue.toInt(),
                    switchControlledBlueValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.SWITCHBASED_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.SWITCHBASED_RED,
                          switchControlledRedValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.SWITCHBASED_GREEN,
                          switchControlledGreenValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.SWITCHBASED_BLUE,
                          switchControlledBlueValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("RED:- ${switchControlledRedValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: switchControlledRedValue,
            onChanged: switchControlledSwitchValue
                ? null
                : (val) {
                    setState(() {
                      switchControlledRedValue = val;
                    });
                  },
            label: switchControlledRedValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          Text("GREEN:- ${switchControlledGreenValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: switchControlledGreenValue,
            onChanged: switchControlledSwitchValue
                ? null
                : (val) {
                    setState(() {
                      switchControlledGreenValue = val;
                    });
                  },
            label: switchControlledGreenValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
          Text("BLUE:- ${switchControlledBlueValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: switchControlledBlueValue,
            onChanged: switchControlledSwitchValue
                ? null
                : (val) {
                    setState(() {
                      switchControlledBlueValue = val;
                    });
                  },
            label: switchControlledBlueValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == SmartLampDetailData.CLAP_BASED)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: clapBasedSwitchValue,
              onChanged: (val) {
                setState(() {
                  clapBasedSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.CLAPBASED_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XCD,
                    clapBasedDarknessValue.toInt(),
                    clapBasedRedValue.toInt(),
                    clapBasedGreenValue.toInt(),
                    clapBasedBlueValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.CLAPBASED_SWITCH, val);
                      MySharedPreference.setDouble(
                          MySharedPreference.CLAPBASED_DARKNEDD,
                          clapBasedDarknessValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.CLAPBASED_RED, clapBasedRedValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.CLAPBASED_GREEN,
                          clapBasedGreenValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.CLAPBASED_BLUE,
                          clapBasedBlueValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("Darkness Threshold (%):- ${clapBasedDarknessValue.round()}"),
          Slider(
            value: clapBasedDarknessValue,
            onChanged: clapBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      clapBasedDarknessValue = val;
                    });
                  },
            label: clapBasedDarknessValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text("RED:- ${clapBasedRedValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: clapBasedRedValue,
            onChanged: clapBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      clapBasedRedValue = val;
                    });
                  },
            label: clapBasedRedValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          Text("GREEN:- ${clapBasedGreenValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: clapBasedGreenValue,
            onChanged: clapBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      clapBasedGreenValue = val;
                    });
                  },
            label: clapBasedGreenValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
          Text("BLUE:- ${clapBasedBlueValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: clapBasedBlueValue,
            onChanged: clapBasedSwitchValue
                ? null
                : (val) {
                    setState(() {
                      clapBasedBlueValue = val;
                    });
                  },
            label: clapBasedBlueValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
        ],
      );
    else if (data.title == SmartLampDetailData.MOBILE_CONTROLLED)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OFF/ON"),
          Switch(
              value: mobileControlledSwitchValue,
              onChanged: (val) {
                setState(() {
                  mobileControlledSwitchValue = val;
                });
                if (!val) {
                  connectivity!.sendData([0XE2]).then((value) {
                    if (value) {
                      MySharedPreference.setBoolean(
                          MySharedPreference.MOBILEBASED_SWITCH, val);
                    }
                  });
                } else {
                  connectivity!.sendData([
                    0XD3,
                    mobileControlledRedValue.toInt(),
                    mobileControlledGreenValue.toInt(),
                    mobileControlledBlueValue.toInt()
                  ]).then((value) {
                    if (value) {
                      print("data send storing in prefs");
                      MySharedPreference.setBoolean(
                          MySharedPreference.MOBILEBASED_SWITCH, val);

                      MySharedPreference.setDouble(
                          MySharedPreference.MOBILEBASED_RED,
                          mobileControlledRedValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.MOBILEBASED_GREEN,
                          mobileControlledGreenValue);
                      MySharedPreference.setDouble(
                          MySharedPreference.MOBILEBASED_BLUE,
                          mobileControlledBlueValue);
                    }
                  });
                }
              }),
          VerticalGap(8),
          Text("RED:- ${mobileControlledRedValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: mobileControlledRedValue,
            onChanged: mobileControlledSwitchValue
                ? null
                : (val) {
                    setState(() {
                      mobileControlledRedValue = val;
                    });
                  },
            label: mobileControlledRedValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          Text("GREEN:- ${mobileControlledGreenValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: mobileControlledGreenValue,
            onChanged: mobileControlledSwitchValue
                ? null
                : (val) {
                    setState(() {
                      mobileControlledGreenValue = val;
                    });
                  },
            label: mobileControlledGreenValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
          Text("BLUE:- ${mobileControlledBlueValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: mobileControlledBlueValue,
            onChanged: mobileControlledSwitchValue
                ? null
                : (val) {
                    setState(() {
                      mobileControlledBlueValue = val;
                    });
                  },
            label: mobileControlledBlueValue.round().toString(),
            max: 255,
            divisions: 255,
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
        ],
      );
    return Container();
  }
}
