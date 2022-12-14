import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/gen/flutterblue.pbserver.dart';
import 'package:flutter/widgets.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/connectivity/bluetooth_serial_connectivty.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/card_widget.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';
import '../connectivity/bluettoth_coneectivty.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';

///Created by Naman Gupta on 5/11/22.

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends BaseClass {
  late MainCategoryModel mainCategoryModel;

  void askPermission() async {
    // ArduinoSerialConnectivity connectivity = ArduinoSerialConnectivity();
    // connectivity.start(context);
  }

  @override
  void initState() {
    super.initState();
    mainCategoryModel = MainCategoryModel();
    setAppBarVisibility(true,
        backgroundColor: AppColors.secondaryColor,
        appBarTitleCenter: true,
        appBarTitle: "Welcome",
        backButtonVisibility: false);
  }

  @override
  Widget setBody() {
    return Container(
      width: DeviceUtils.getScreenWidtht(context),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.BACKGROUND_BLUE), fit: BoxFit.fill)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              MainCategoryDetail detailModel =
                  mainCategoryModel.getMainCategoryModel().elementAt(index);
              return Container(
                width: DeviceUtils.getScreenWidtht(context) * 0.40,
                height: DeviceUtils.getScreenHeight(context) * 0.50,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: InkWell(
                    onTap: () => onSelectCategory(detailModel, index),
                    borderRadius: BorderRadius.circular(Dimensions.size_12),
                    splashColor: AppColors.primaryColor,
                    hoverColor: AppColors.primaryColor,
                    focusColor: AppColors.primaryColor,
                    child: CardWidget(detailModel)),
              );
            },
            itemCount: mainCategoryModel.getMainCategoryModel().length,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }

  void onSelectCategory(MainCategoryDetail model, int index) {
    if (index != mainCategoryModel.mainCategoryList.length - 1)
      Navigator.of(context).pushNamed(Classes.subCategory, arguments: model);
    else
      Navigator.of(context).pushNamed(Classes.iotScreen);
  }
}
