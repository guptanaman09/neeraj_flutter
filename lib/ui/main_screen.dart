import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

import '../connectivity/bluettoth_coneectivty.dart';

///Created by Naman Gupta on 5/11/22.

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

void askRuntimePermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.bluetooth,
    Permission.bluetoothAdvertise,
    Permission.bluetoothConnect,
    Permission.bluetoothScan,
  ].request();
  print(statuses[Permission.bluetooth]);
}

void startScan() {
  BleConnectivity bleConnectivity = BleConnectivity();
  bleConnectivity.startScanning();
}

class MainScreenState extends BaseClass {
  @override
  Widget setBody() {
    askRuntimePermissions();
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            AppLocalizations.strings.welcome!,
            MyTextStyles.titleTextStyle(AppColors.black),
            textAlign: TextAlign.center,
          ),
          MaterialButton(
            onPressed: startScan,
            child: Text("Scan"),
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}
