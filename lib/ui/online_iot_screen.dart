import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/connectivity/FirebaseConnectivity.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/data/shared_preference/my_shared_preference.dart';
import 'package:neeraj_flutter_app/models/offline_screen_data.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_button.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/custom_text_field.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';
import 'package:neeraj_flutter_app/connectivity/offline_udp_connectivity.dart';

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
  late UdpConnectivity? connectivity;

  @override
  void initState() {
    super.initState();
    connectivity = UdpConnectivity();
    connectivity!.start(context, onRecvValue);
    textEditingControllerUserName = TextEditingController();
    textEditingControllerPaswword = TextEditingController();
  }

  void onRecvValue(List<int> data) {}
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          toolbarHeight: 40,
          title: Text(
            "",
          ),
          centerTitle: true,
          leading: true
              ? GestureDetector(
                  onTap: () {
                    try {
                      if (Navigator.canPop(context)) {
                        Navigator.of(context).pop("result");
                      }
                    } catch (error) {}
                  },
                  child: Container(
                      padding: EdgeInsets.all(Dimensions.size_4),
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: AppColors.white,
                        size: Dimensions.size_28,
                      )),
                )
              : Container(),
          elevation: 0,
        ),
        body: SingleChildScrollView(
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
                      child: Center(
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
                    child: InkWell(
                      onTap: onSkip,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: CustomText(
                            "Skip->", MyTextStyles.getItalicTextStyle()),
                      ),
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

  void onSkip() {
    Navigator.of(context).pushNamed(Classes.offlineMainCategoryScreen,
        arguments: OfflineGamePlayType.ONLINE);
  }

  void onUserNameChanged(String userName) {}

  void onConnect(BuildContext context) {
    if (textEditingControllerUserName.text.isEmpty) {
      showToast("Please enter username!");
    } else if (textEditingControllerPaswword.text.isEmpty) {
      showToast("Please enter password");
    } else {
      showAlertOkayMessage(
          "Make sure you entered the correct wifi name and password other wise your device " +
              connectivity!.wifiName! +
              " will not able to connect with network." +
              "\nWifi name=" +
              textEditingControllerUserName.text +
              " \nPassword=" +
              textEditingControllerPaswword.text, () {
        sendCommand();
      });
      //call conection

    }
  }

  void sendCommand() {
    String diffSymbol = "\$";
    String userPass = textEditingControllerPaswword.text.toString() +
        diffSymbol +
        textEditingControllerUserName.text.toString();
    List<int> data = [];
    data.add(0XE4);
    data.addAll(utf8.encode(userPass));
    connectivity!.sendData(data).then((value) {
      if (value) {
        MySharedPreference.setString(
            MySharedPreference.CONNECTEDWIFINAME, connectivity!.wifiName!);
        onSkip();
      }
    });
  }

  void showAlertOkayMessage(String message, Function onOkayPressed) {
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
                onOkayPressed();
              },
              child: Container(
                color: Colors.deepPurple,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Container(
                color: Colors.deepPurple,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "Change",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
