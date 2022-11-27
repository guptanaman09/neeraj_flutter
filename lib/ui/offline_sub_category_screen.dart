import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';
import 'package:neeraj_flutter_app/models/offline_data.dart';
import 'package:neeraj_flutter_app/models/offline_screen_data.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/offline_sub_card_widget.dart';

///Created by Naman Gupta on 6/11/22.

class OfflineSubCategoryScreen extends StatefulWidget {
  List<dynamic> model;

  OfflineSubCategoryScreen(this.model);

  @override
  State<StatefulWidget> createState() {
    return OfflineSubCategoryScreenState(this.model);
  }
}

class OfflineSubCategoryScreenState extends BaseClass {
  List<dynamic> model;

  OfflineSubCategoryScreenState(this.model);

  @override
  void initState() {
    super.initState();
    print("offline type >>> ${model[1]} >>>> ${(model[0] as OfflineMainCategoryDetail).subCategoryDetailList}");
    setAppBarVisibility(true,
        backgroundColor: AppColors.secondaryColor,
        appBarTitleCenter: true,
        appBarTitle: model[0].title,
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
            children: (model[0] as OfflineMainCategoryDetail).subCategoryDetailList
                .map((e) => GestureDetector(
                    onTap: () {
                      if (e.title == OfflineSubCategoryData.SMART_LAMP)
                        Navigator.of(context)
                            .pushNamed(Classes.smartLampCategoryScreen);
                      else {
                        if(model[1] == OfflineGamePlayType.OFFLINE)
                        Navigator.of(context).pushNamed(
                            Classes.offLineGamePlayScreen,
                            arguments: [e, model[1]]);
                        else
                          Navigator.of(context).pushNamed(
                              Classes.onlineGamePlayScreen,
                              arguments: e);
                      }
                    },
                    child: OfflineSubCardWidget(e, Colors.green)))
                .toList(),
          ))
        ],
      ),
    );
  }
}
