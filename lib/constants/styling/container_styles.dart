import 'package:flutter/cupertino.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';

///Created by Naman Gupta on 21/4/21.

// this class contains the styling.

class ContainerStyle {
  // style for curve border container
  static BoxDecoration getBorderContainerStyle() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.black,
        width: Dimensions.size_2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(Dimensions.size_16)),
    );
  }
}
