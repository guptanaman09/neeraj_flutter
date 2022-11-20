import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
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
  bool smartDustbinSwitchValue = false;
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

  @override
  void initState() {
    super.initState();

    dancingDollWifiName = TextEditingController();
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
          "Control the AC Appliances like Desk Lamp, Night Lamp, Tanle Fan or any other small appliance using the app. \n Circuit Blocks nedded - Relay and RGB LED Connections with CPU - \n Relay at Port 1 \n RGB LED at Port 3",
          TextStyle(color: Colors.white, fontSize: 14)),
    );
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
            },
            activeTrackColor: Colors.yellow,
            activeColor: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("ON")),
              HorizontalGap(24),
              ElevatedButton(onPressed: () {}, child: Text("OFF")),
            ],
          )
        ],
      );
    else if (data.title == OfflineSubCategoryData.SMART_DUSTBIN)
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
              }),
          Text("Sensing Distance (cm):- ${dustbinSensingSliderValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: dustbinSensingSliderValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
    else if (data.title == OfflineSubCategoryData.IRON_MAN_HAND)
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
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
              }),
          VerticalGap(8),
          Text(
              "Dry Threshold (%):- ${smartIrrigationDryThresholdValue.round()}"),
          Slider(
            value: smartIrrigationDryThresholdValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
              }),
          VerticalGap(8),
          Text(
              "Darkness Threshold (%):- ${smartAlarmDarknessThresholdValue.round()}"),
          Slider(
            value: smartAlarmDarknessThresholdValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
              }),
          VerticalGap(8),
          Text("Sensing Distance (cm):- ${burglarAlarmValue.round()}"),
          Slider(
            value: burglarAlarmValue,
            onChanged: (val) {
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
              }),
          VerticalGap(8),
          Text(
              "Sensing Distance (cm):- ${soapDisSensindDistanceValue.round()}"),
          Slider(
            value: soapDisSensindDistanceValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
              }),
          VerticalGap(8),
          Text("Sensing Distance (cm):- ${petFeederSensingValue.round()}"),
          Slider(
            value: petFeederSensingValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
              }),
          VerticalGap(8),
          Text("RLI Threshold (%):- ${touchlessDorbellValue.round()}"),
          Slider(
            value: touchlessDorbellValue,
            onChanged: (val) {
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
    else if(data.title == SmartLampDetailData.LIGHT_SENSOR_BASED)
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
              }),
          VerticalGap(8),
          Text("Darkness Threshold (%):- ${lightBasedDarknessValue.round()}"),
          Slider(
            value: lightBasedDarknessValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
    else if(data.title == SmartLampDetailData.GESTURE_BASED)
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
              }),
          VerticalGap(8),
          Text("Darkness Threshold (%):- ${gestureBasedDarknessValue.round()}"),
          Slider(
            value: gestureBasedDarknessValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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

    else if(data.title == SmartLampDetailData.SWITCH_CONTROLLED)
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
              }),
          VerticalGap(8),
          Text("RED:- ${switchControlledRedValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: switchControlledRedValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
    else if(data.title == SmartLampDetailData.CLAP_BASED)
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
              }),
          VerticalGap(8),
          Text("Darkness Threshold (%):- ${clapBasedDarknessValue.round()}"),
          Slider(
            value: clapBasedDarknessValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
    else if(data.title == SmartLampDetailData.MOBILE_CONTROLLED)
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
              }),
          VerticalGap(8),
          Text("Darkness Threshold (%):- ${mobileControlledDarknessValue.round()}"),
          Slider(
            value: mobileControlledDarknessValue,
            onChanged: (val) {
              setState(() {
                mobileControlledDarknessValue = val;
              });
            },
            label: mobileControlledDarknessValue.round().toString(),
            max: 100,
            divisions: 100,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Text("RED:- ${mobileControlledRedValue.round()}",
              style: TextStyle(fontSize: 12)),
          Slider(
            value: mobileControlledRedValue,
            onChanged: (val) {
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
            onChanged: (val) {
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
            onChanged: (val) {
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
