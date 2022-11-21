import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:neeraj_flutter_app/utils/internet_connectivity.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:udp/udp.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart' as myHandler;

///Created by Neeraj Vijayvargiya on 10/11/22.
class UdpConnectivity {
  UDP? conn;
  late BuildContext context;
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
    this.context = context;
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
    Map<Permission, myHandler.PermissionStatus> statuses =
        await [Permission.location].request();
    if (statuses[Permission.location] == myHandler.PermissionStatus.granted) {
      print(statuses[Permission.location]);
      //showBottomDialog(context);
      Location location = new Location();
      bool isOn = await location.serviceEnabled();
      if (!isOn) {
        isOn = await location.requestService();
      }
      if (isOn) {
        NetworkInfo info = NetworkInfo();
        String? wifiName = await info.getWifiName();
        print(wifiName ?? "wifi name not found");
        if (!wifiName!.toLowerCase().contains("intellecto")) {
          //show alert here and
          showAlertMessage("connect to the actual intellecto device", context);
        } else {
          // make udp connection
          makeudpConnection();
        }
      } else {
        start(context);
      }
    }
  }

  void makeudpConnection() async {
    conn = await UDP.bind(Endpoint.any(port: Port.any));
    conn!.asStream().listen((event) {
      print("recv udp data:" + String.fromCharCodes(event!.data));
    });
  }

  void closeConnection() {
    conn!.close();
  }

  Future<bool> sendData(List<int> data) async {
    if (conn == null) {
      start(context);
      return false;
    }
    var datalength = await conn!.send(
        data,
        Endpoint.multicast(
            InternetAddress("192.168.4.1", type: InternetAddressType.IPv4),
            port: Port(8888)));
    print("Data send size" + datalength.toString());
    if (datalength > 0) {
      return true;
    }
    return false;
  }
}
