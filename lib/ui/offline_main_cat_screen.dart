import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/models/category_data.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/offline_card_widget.dart';

///Created by Naman Gupta on 6/11/22.

class OfflineMainCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OfflineMainCategoryScreenState();
  }
}

class OfflineMainCategoryScreenState extends BaseClass {
  late OfflineCategoryModel offlineMainCategoryModel;

  @override
  void initState() {
    super.initState();

    offlineMainCategoryModel = OfflineCategoryModel();

    setAppBarVisibility(true,
        backgroundColor: AppColors.secondaryColor,
        appBarTitleCenter: true,
        appBarTitle: CategoryData.INTELLECTO,
        backButtonVisibility: true);
  }

  @override
  Widget? setBody() {
    return Container(
      width: DeviceUtils.getScreenWidtht(context),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              OfflineMainCategoryDetail detailModel = offlineMainCategoryModel
                  .getMainCategoryModel()
                  .elementAt(index);
              Color color = getColor(index);
              return Container(
                width: DeviceUtils.getScreenWidtht(context) * 0.40,
                height: DeviceUtils.getScreenHeight(context) * 0.50,
                margin: EdgeInsets.all(Dimensions.size_20),
                child: InkWell(
                    onTap: () => onSelectCategory(detailModel, index),
                    borderRadius: BorderRadius.circular(Dimensions.size_12),
                    splashColor: AppColors.primaryColor,
                    hoverColor: AppColors.primaryColor,
                    focusColor: AppColors.primaryColor,
                    child: OfflineCardWidget(detailModel, color)),
              );
            },
            itemCount: offlineMainCategoryModel.getMainCategoryModel().length,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }

  void onSelectCategory(OfflineMainCategoryDetail model, int index) {
    Navigator.of(context)
        .pushNamed(Classes.offlineSubCategoryScreen, arguments: model);
  }

  Color getColor(int index) {
    switch (index) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }
}
