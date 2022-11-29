import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/models/offline_data.dart';
import 'package:neeraj_flutter_app/models/offline_screen_data.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/offline_sub_card_widget.dart';

class SmartLampCategoryScreen extends StatefulWidget {
  OfflineGamePlayType offlineGamePlayType;

  SmartLampCategoryScreen(this.offlineGamePlayType);

  @override
  State<StatefulWidget> createState() {
    return SmartLampCategoryScreenState(this.offlineGamePlayType);
  }
}

class SmartLampCategoryScreenState extends BaseClass {

  OfflineGamePlayType offlineGamePlayType;

  late List<OfflineSubCategoryDetail> dataList;

  SmartLampCategoryScreenState(this.offlineGamePlayType);

  @override
  void initState() {
    super.initState();

    print("type got in smart lamp is >>> ${offlineGamePlayType}");

    dataList = SmartLampData().getData();
  }

  @override
  Widget? setBody() {
    return Container(
      width: DeviceUtils.getScreenWidtht(context),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            children: dataList
                .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          Classes.offLineGamePlayScreen,
                          arguments: [e,offlineGamePlayType]);
                    },
                    child: OfflineSubCardWidget(e, Colors.green)))
                .toList(),
          ))
        ],
      ),
    );
  }
}

class SmartLampData {
  List<OfflineSubCategoryDetail> getData() {
    List<OfflineSubCategoryDetail> list = [];

    OfflineSubCategoryDetail data1 = OfflineSubCategoryDetail(
        SmartLampDetailData.LIGHT_SENSOR_BASED,
        Assets.LIGHT_SENSOR,
        OfflineSubCategoryData.SMART_LAMP);
    list.add(data1);
    OfflineSubCategoryDetail data2 = OfflineSubCategoryDetail(
        SmartLampDetailData.GESTURE_BASED,
        Assets.GESTURE_BASED,
        OfflineSubCategoryData.SMART_LAMP);
    list.add(data2);

    OfflineSubCategoryDetail data3 = OfflineSubCategoryDetail(
        SmartLampDetailData.SWITCH_CONTROLLED,
        Assets.SWITCH_CONTROLLED,
        OfflineSubCategoryData.SMART_LAMP);
    list.add(data3);

    OfflineSubCategoryDetail data4 = OfflineSubCategoryDetail(
      SmartLampDetailData.CLAP_BASED,
      Assets.CLAP_BASED,
      OfflineSubCategoryData.SMART_LAMP,
    );
    list.add(data4);

    OfflineSubCategoryDetail data5 = OfflineSubCategoryDetail(
        SmartLampDetailData.MOBILE_CONTROLLED,
        Assets.MOBILE_CONTROLLED,
        OfflineSubCategoryData.SMART_LAMP);
    list.add(data5);

    return list;
  }
}

class SmartLampDetailData {
  static const String LIGHT_SENSOR_BASED = "Light Sensor Based";
  static const String GESTURE_BASED = "Gesture Based";
  static const String SWITCH_CONTROLLED = "Switch Controlled";
  static const String CLAP_BASED = "Clap Based";
  static const String MOBILE_CONTROLLED = "Mobile Controlled";
}
