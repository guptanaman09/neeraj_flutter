import 'package:flutter/material.dart';

///Created by Naman Gupta on 19/4/21.

class Logger {
  static void log(String msg) {
    print(msg);
  }

  static void logd(String msg) {
    debugPrint(msg);
  }
}
