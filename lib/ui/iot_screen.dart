import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';

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

    setAppBarVisibility(true,
        backgroundColor: AppColors.secondaryColor,
        appBarTitleCenter: true,
        appBarTitle: "Welcome to IOT cloud",
        backButtonVisibility: true);
  }

  @override
  Widget? setBody() {
    return Container(
      width: DeviceUtils.getScreenWidtht(context),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomText(
              "Select the connection medium",
              MyTextStyles.titleTextStyle(AppColors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onSelectOption(IOTOption.OFFLINE),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColorDark,
                        AppColors.primaryColorLight
                      ],
                    )),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomText(
                            "OFFLINE",
                            MyTextStyles.titleTextStyle(AppColors.white),
                            textAlign: TextAlign.center,
                          ),
                          VerticalGap(Dimensions.size_16),
                          Image.asset(
                            Assets.OFFLINE,
                            height: DeviceUtils.getScreenHeight(context) * 0.30,
                            width: DeviceUtils.getScreenWidtht(context) * 0.30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () => onSelectOption(IOTOption.ONLINE),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      AppColors.secondaryColor,
                      AppColors.secondaryColorLight
                    ],
                  )),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          "ONLINE",
                          MyTextStyles.titleTextStyle(AppColors.white),
                          textAlign: TextAlign.center,
                        ),
                        VerticalGap(Dimensions.size_16),
                        Image.asset(
                          Assets.ONLINE,
                          height: DeviceUtils.getScreenHeight(context) * 0.30,
                          width: DeviceUtils.getScreenWidtht(context) * 0.30,
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ))
        ],
      ),
    );
  }

  void onSelectOption(IOTOption option) {
    if (option == IOTOption.ONLINE) {
      Navigator.of(context).pushNamed(Classes.onlineIOTScreen);
    } else
      Navigator.of(context).pushNamed(Classes.offlineMainCategoryScreen);
  }
}

enum IOTOption { ONLINE, OFFLINE }
