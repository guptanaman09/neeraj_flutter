import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/card_title_text_style.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';

///Created by Naman Gupta on 6/11/22.

class OfflineCardWidget extends StatelessWidget {
  late OfflineMainCategoryDetail detailModel;
  late Color color;

  OfflineCardWidget(this.detailModel, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.size_12)),
      elevation: Dimensions.size_4,
      child: Container(
        color: color,
        margin: EdgeInsets.all(Dimensions.size_12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Image.asset(
              detailModel.image,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            )),
            Container(
              padding: EdgeInsets.all(Dimensions.size_8),
              child: Center(
                child: CustomText(
                  detailModel.title,
                  CardTitleTextStyle.getStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
