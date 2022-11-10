import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/sub_category_card_widget.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';
import 'package:permission_handler/permission_handler.dart';

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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.BACKGROUND_BLUE), fit: BoxFit.fill)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                    child:
                        SubCategoryCardWidget(detailModel, onPlayButtonClick)),
              );
            },
            itemCount: model.subCategoryDetailList.length,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }

  void onSubCatPress() async {
    print("play game clicked");
    Map<Permission, PermissionStatus> statuses =
        await [Permission.bluetoothConnect, Permission.bluetoothScan].request();
    if (statuses[Permission.bluetoothConnect] == PermissionStatus.granted) {
      print(statuses[Permission.bluetoothConnect]);
      //showBottomDialog(context);
      Navigator.of(context).pushNamed(Classes.bluetoothBle);
    }
  }

  void onSelectCategory(SubCategoryDetail model) {
    print("sub category >>> ${model.title}");
  }

  void onPlayButtonClick(SubCategoryDetail model) {
    print("play game clicked  ${model.title}");
    Navigator.of(context).pushNamed(Classes.freeRunScreen, arguments: model);
  }
}
