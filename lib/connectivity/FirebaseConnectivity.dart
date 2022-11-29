import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hex/hex.dart';
import 'package:neeraj_flutter_app/data/shared_preference/my_shared_preference.dart';
import 'package:neeraj_flutter_app/utils/internet_connectivity.dart';

///Created by Neeraj Vijayvargiya on 28/11/22.
class FirebaseConnctivity {
  FirebaseDatabase instance = FirebaseDatabase.instance;
  late String wifiName;
  late DatabaseReference ref;

  void start() async {
    wifiName = await MySharedPreference.getString(
        MySharedPreference.CONNECTEDWIFINAME);
    ref = instance
        .refFromURL("https://iot-cloud-02-default-rtdb.firebaseio.com/");
  }

  Future<bool> sendData(List<int> data) async {
    String hashCode = data.first.toString();
    String value1 = "0";
    String value2 = "0";
    String value3 = "0";
    String value4 = "0";
    if (data.length >= 2) {
      value1 = data[1].toString();
    }
    if (data.length >= 3) {
      value2 = data[2].toString();
    }
    if (data.length >= 4) {
      value3 = data[3].toString();
    }
    if (data.length >= 5) {
      value4 = data[4].toString();
    }
    print("hashCode=${hashCode.toString()}");
    InternetConnectivity connectivity = InternetConnectivity();
    bool isConnected = await connectivity.checkConnection();
    if (!isConnected) {
      showToast(
          "No internet connection found ! connect to the internet and try again.");
      return false;
    }
    ref.child(wifiName).get().then((value) {
      if (value.exists) {
        //cll update
        ref.child(wifiName).update({
          "hex_code": hashCode,
          "val": {
            "value1": value1,
            "value2": value2,
            "value3": value3,
            "value4": value4,
          }
        });
      } else {
        //set value
        ref.child(wifiName).set({
          "hex_code": hashCode,
          "val": {
            "value1": value1,
            "value2": value2,
            "value3": value3,
            "value4": value4,
          }
        });
      }
    });

    //
    // ref.child(wifiName).get().then((value) {
    //   if (value.exists) {
    //     print("firebase data:${value.children.first.value.toString()}");
    //   } else {
    //     //create whole node
    //
    //   }
    // });
    //
    // showToast(
    //     "Device connection lost. make sure you are connected to the intellecto wifi");
    return true;
  }

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
}
