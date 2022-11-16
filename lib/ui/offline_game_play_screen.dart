import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/models/offline_data.dart';
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

  bool applianceSwitchValue = false;
  bool smartDustbinSwitchValue = false;
  bool smartIrrigationSwitchValue = false;
  bool smartAlarmSwitchValue = false;
  bool burglarAlarmSwitchValue = false;
  bool soapDispencerSwitchValue = false;
  bool petFeederSwitchValue = false;
  bool airGuitarSwitchValue = false;
  bool touchlessDorbellSwitchValue = false;

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
              "Enter the WiFi Name of the Magic Wand CPU, so that the Wand and Dolls can be paried.",
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
    return Container();
  }
}
