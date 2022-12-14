import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/card_title_text_style.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';

///Created by Naman Gupta on 5/11/22.

class CardWidget extends StatelessWidget {
  final MainCategoryDetail detailModel;

  CardWidget(
    this.detailModel,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Dimensions.size_4,
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.size_4),
                topLeft: Radius.circular(Dimensions.size_4))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.size_4),
                      topLeft: Radius.circular(Dimensions.size_4))),
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Center(
                child: CustomText(
                  detailModel.title,
                  CardTitleTextStyle.getStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.secondaryColorLight,
                    AppColors.secondaryColorLight
                  ])),
                  child: Image.asset(
                    detailModel.image,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
