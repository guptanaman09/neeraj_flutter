import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';

///Created by Naman Gupta on 5/11/22.

class MyTextStyles {
  static TextStyle titleTextStyle(Color color,
      {FontWeight fontWeight = FontWeight.w800,
      double fontSize = Dimensions.size_18}) {
    return TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize);
  }
}
