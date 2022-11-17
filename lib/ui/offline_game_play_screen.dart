import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/connectivity/offline_udp_connectivity.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/models/offline_data.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
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

  bool applianceSwitchValue = false;
  bool smartDustbinSwitchValue = false;

  @override
  void initState() {
    UdpConnectivity connectivity = UdpConnectivity();
    connectivity.start(context);
    super.initState();
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
    else
      return Container();
  }
}
