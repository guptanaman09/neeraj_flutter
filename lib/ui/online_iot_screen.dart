import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_button.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/custom_text_field.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';

///Created by Naman Gupta on 6/11/22.

class OnlineIOTScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OnlineIOTScreenState();
  }
}

class OnlineIOTScreenState extends State<StatefulWidget> {
  late TextEditingController textEditingControllerUserName;
  late TextEditingController textEditingControllerPaswword;

  @override
  void initState() {
    super.initState();
    textEditingControllerUserName = TextEditingController();
    textEditingControllerPaswword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(Dimensions.size_16),
            height: DeviceUtils.getScreenHeight(context),
            width: DeviceUtils.getScreenWidtht(context),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.FORM_BACKGROUND),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    "Welcome",
                    MyTextStyles.getItalicTextStyle(
                        fontSize: Dimensions.size_32)),
                VerticalGap(Dimensions.size_8),
                CustomText(
                    "Enter the WiFi SSID & Password",
                    MyTextStyles.titleTextStyle(AppColors.black,
                        fontSize: Dimensions.size_20,
                        fontWeight: Dimensions.fontWeight_500)),
                VerticalGap(Dimensions.size_32),
                CustomText(
                    "Not connected",
                    MyTextStyles.getItalicTextStyle(
                        fontSize: Dimensions.size_20)),
                VerticalGap(Dimensions.size_16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText(
                        "Username",
                        MyTextStyles.titleTextStyle(AppColors.black,
                            fontWeight: Dimensions.fontWeight_500)),
                    HorizontalGap(Dimensions.size_8),
                    Container(
                      height: 50,
                      width: 200,
                      padding: EdgeInsets.all(Dimensions.size_4),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.black, width: 2.0)),
                      child: CustomTextField(
                          textEditingControllerUserName,
                          TextInputType.visiblePassword,
                          const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter SSID",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimensions.size_14,
                                fontWeight: Dimensions.fontWeight_800),
                          ),
                          const TextStyle(),
                          onChanged: onUserNameChanged),
                    ),
                  ],
                ),
                VerticalGap(Dimensions.size_16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText(
                        "Password",
                        MyTextStyles.titleTextStyle(AppColors.black,
                            fontWeight: Dimensions.fontWeight_500)),
                    HorizontalGap(Dimensions.size_8),
                    Container(
                      height: 50,
                      width: 200,
                      padding: EdgeInsets.all(Dimensions.size_4),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.black, width: 2.0)),
                      child: CustomTextField(
                          textEditingControllerPaswword,
                          TextInputType.text,
                          const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimensions.size_14,
                                fontWeight: Dimensions.fontWeight_800),
                          ),
                          const TextStyle(),
                          onChanged: onUserNameChanged),
                    ),
                  ],
                ),
                VerticalGap(Dimensions.size_16),
                Container(
                    width: DeviceUtils.getScreenWidtht(context) * 0.30,
                    child: CustomButton("Connect", onConnect)),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      child: CustomText(
                          "Skip->", MyTextStyles.getItalicTextStyle()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onUserNameChanged(String userName) {}

  void onConnect() {}
}
