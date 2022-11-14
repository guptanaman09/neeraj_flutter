import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/utils/internet_connectivity.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:udp/udp.dart';
import 'package:network_info_plus/network_info_plus.dart';

///Created by Neeraj Vijayvargiya on 10/11/22.
class UdpConnectivity {
  late UDP conn;
  void showAlertMessage(String message, BuildContext context) {
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
              },
              child: Container(
                color: Colors.deepPurple,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "okay",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  void start(BuildContext context) async {
    Connectivity cn = Connectivity();
    ConnectivityResult result = await cn.checkConnectivity();
    cn.onConnectivityChanged.listen((event) {
      if (result != ConnectivityResult.wifi) {
        //show alert here
        showAlertMessage(
            "switch on the wifi connection and connect to the intellecto device",
            context);
      }
    });
    if (result != ConnectivityResult.wifi) {
      //show alert here
      showAlertMessage(
          "switch on the wifi connection and connect to the intellecto device",
          context);

      return;
    }
    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
    if (statuses[Permission.location] == PermissionStatus.granted) {
      print(statuses[Permission.location]);
      //showBottomDialog(context);
      NetworkInfo info = NetworkInfo();
      String? wifiName = await info.getWifiName();
      print("wifi name=" + wifiName!);
      if (!wifiName!.toLowerCase().contains("intellecto")) {
        //show alert here and
        showAlertMessage("connect to the actual intellecto device", context);
      } else {
        // make udp connection
        makeudpConnection();
      }
    }
  }

  void makeudpConnection() async {
    conn = await UDP.bind(Endpoint.any(port: Port.any));
    sendData();
    conn.asStream().listen((event) {
      print("recv udp data:" + String.fromCharCodes(event!.data));
    });
  }

  void sendData() async {
    var datalength = await conn.send(
        [0XC2, 0X64],
        Endpoint.multicast(
            InternetAddress("192.168.4.1", type: InternetAddressType.IPv4),
            port: Port(8888)));
    print("Data send size" + datalength.toString());
  }
}
