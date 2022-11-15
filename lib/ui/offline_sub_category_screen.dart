import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/my_text_styles.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/offline_sub_card_widget.dart';

///Created by Naman Gupta on 6/11/22.

class OfflineSubCategoryScreen extends StatefulWidget {
  OfflineMainCategoryDetail model;

  OfflineSubCategoryScreen(this.model);

  @override
  State<StatefulWidget> createState() {
    return OfflineSubCategoryScreenState(this.model);
  }
}

class OfflineSubCategoryScreenState extends BaseClass {
  OfflineMainCategoryDetail model;

  OfflineSubCategoryScreenState(this.model);

  @override
  void initState() {
    super.initState();

    setAppBarVisibility(true,
        backgroundColor: AppColors.secondaryColor,
        appBarTitleCenter: true,
        appBarTitle: model.title,
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
              child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            children: model.subCategoryDetailList
                .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          Classes.offLineGamePlayScreen,
                          arguments: e);
                    },
                    child: OfflineSubCardWidget(e, Colors.green)))
                .toList(),
          ))
        ],
      ),
    );
  }
}
