import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';

///Created by Naman Gupta on 6/11/22.

class IOTScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IOTScreenState();
  }
}

class IOTScreenState extends BaseClass {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget? setBody() {
    return Container(
      width: DeviceUtils.getScreenWidtht(context),
      margin: EdgeInsets.only(top: Dimensions.size_16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: DeviceUtils.getScreenWidtht(context),
            height: Dimensions.size_50,
            color: AppColors.secondaryColor,
            child: Center(
              child: CustomText(
                "Welcome to IOT cloud",
                MyTextStyles.titleTextStyle(AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          HorizontalGap(Dimensions.size_16),
          CustomText(
            "Select the connection medium",
            MyTextStyles.titleTextStyle(AppColors.black),
            textAlign: TextAlign.center,
          ),
          HorizontalGap(Dimensions.size_16),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomText(
                  "Welcome to IOT cloud",
                  MyTextStyles.titleTextStyle(AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: CustomText(
                "Welcome to IOT cloud",
                MyTextStyles.titleTextStyle(AppColors.white),
                textAlign: TextAlign.center,
              ))
            ],
          ))
        ],
      ),
    );
  }
}
