import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';

///Created by Naman Gupta on 21/4/21.

class AuthStyles {
  AuthStyles._();

  // style of text for text input field
  static TextStyle textStyle() {
    return TextStyle(
      fontSize: Dimensions.size_14,
      color: AppColors.black,
      fontWeight: Dimensions.fontWeight_500,
    );
  }

  // style input decoration for text input field that hides the underline etc.
  static InputDecoration inputDecoration({
    String? hintText,
  }) {
    return InputDecoration(
        hintText: hintText ?? "",
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(Dimensions.size_8),
        border: InputBorder.none,
        hintStyle:
            TextStyle(color: AppColors.grey, fontSize: Dimensions.size_14),
        labelStyle:
            TextStyle(color: AppColors.black, fontSize: Dimensions.size_14));
  }
}
