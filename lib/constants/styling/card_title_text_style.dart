import 'package:flutter/cupertino.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';

///Created by Naman Gupta on 5/11/22.

class CardTitleTextStyle {
  CardTitleTextStyle._();

  static TextStyle getStyle() {
    return TextStyle(
        fontSize: Dimensions.size_18,
        color: AppColors.white,
        fontWeight: FontWeight.w700);
  }
}
