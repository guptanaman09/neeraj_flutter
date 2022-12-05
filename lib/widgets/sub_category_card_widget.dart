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

  late final Function onPlayButtonClick;

  SubCategoryCardWidget(this.detailModel, this.onPlayButtonClick);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.size_12)),
      elevation: Dimensions.size_4,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.secondaryColorLight,
          AppColors.secondaryColorLight
        ])),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: AppColors.secondaryColor,
                padding: EdgeInsets.all(Dimensions.size_8),
                child: Center(
                  child: CustomText(
                    detailModel.title,
                    CardTitleTextStyle.getStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(Dimensions.size_16),
              child: Image.asset(
                detailModel.image,
                alignment: Alignment.center,
              ),
            )),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.size_32, vertical: Dimensions.size_8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(Dimensions.size_8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.size_10),
                      ),
                    ),
                  ),
                  onPressed: () => onPlayButtonClick(detailModel),
                  child: Container(
                      width: DeviceUtils.getScreenWidtht(context),
                      child: CustomText(
                        "Play",
                        ButtonStyles.getButtonTextStyle(),
                        textAlign: TextAlign.center,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
