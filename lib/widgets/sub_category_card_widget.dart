import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/button_style.dart';
import 'package:neeraj_flutter_app/constants/styling/card_title_text_style.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_button.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';

///Created by Naman Gupta on 5/11/22.

class SubCategoryCardWidget extends StatelessWidget {
  final SubCategoryDetail detailModel;

  SubCategoryCardWidget(
    this.detailModel,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.size_12)),
      elevation: Dimensions.size_4,
      child: Container(
        margin: EdgeInsets.all(Dimensions.size_12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.primaryColor,
              padding: EdgeInsets.all(Dimensions.size_8),
              child: Center(
                child: CustomText(
                  detailModel.title,
                  CardTitleTextStyle.getStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(Dimensions.size_16),
              child: Image.asset(
                detailModel.image,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(Dimensions.size_8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.size_10),
                    ),
                  ),
                ),
                onPressed: onSubCatPress,
                child: Container(
                    width: DeviceUtils.getScreenWidtht(context),
                    child: CustomText(
                      "Play",
                      ButtonStyles.getButtonTextStyle(),
                      textAlign: TextAlign.center,
                    )))
          ],
        ),
      ),
    );
  }

  void onSubCatPress() {
    print("play game clicked");
  }
}
