import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/card_widget.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/sub_category_card_widget.dart';

///Created by Naman Gupta on 5/11/22.

class SubCategoryScreen extends StatefulWidget {
  late MainCategoryDetail model;

  SubCategoryScreen(this.model);

  @override
  State<StatefulWidget> createState() {
    return SubCategoryScreenState(model);
  }
}

class SubCategoryScreenState extends BaseClass {
  late MainCategoryDetail model;
  SubCategoryScreenState(this.model);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget? setBody() {
    return Container(
      width: DeviceUtils.getScreenWidtht(context),
      margin: EdgeInsets.only(top: Dimensions.size_16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: DeviceUtils.getScreenWidtht(context),
            height: Dimensions.size_50,
            color: AppColors.secondaryColor,
            child: Center(
              child: CustomText(
                AppLocalizations.strings.welcome!,
                MyTextStyles.titleTextStyle(AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          HorizontalGap(Dimensions.size_16),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              SubCategoryDetail detailModel =
                  model.subCategoryDetailList.elementAt(index);
              return Container(
                width: DeviceUtils.getScreenWidtht(context) * 0.40,
                height: DeviceUtils.getScreenHeight(context) * 0.50,
                margin: EdgeInsets.all(Dimensions.size_20),
                child: InkWell(
                    onTap: () => onSelectCategory(detailModel),
                    borderRadius: BorderRadius.circular(Dimensions.size_12),
                    splashColor: AppColors.primaryColor,
                    hoverColor: AppColors.primaryColor,
                    focusColor: AppColors.primaryColor,
                    child: SubCategoryCardWidget(detailModel)),
              );
            },
            itemCount: model.subCategoryDetailList.length,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }

  void onSelectCategory(SubCategoryDetail model) {
    print("sub category >>> ${model.title}");
  }
}
