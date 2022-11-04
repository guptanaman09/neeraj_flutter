import 'package:flutter/cupertino.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';

///Created by Naman Gupta on 21/4/21.

//this class contains different styles for buttons

class ButtonStyles {
  ButtonStyles._();

  // style of text of a button.
  static TextStyle getButtonTextStyle(
      {Color color = AppColors.white, double fontSize = Dimensions.size_16}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: Dimensions.fontWeight_700);
  }

  // style for bordered Image button.
  static BoxDecoration getImageButtonBoxDecoration(
      {Color color = AppColors.secondaryColor,
      double borderRadius = Dimensions.size_16}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}
