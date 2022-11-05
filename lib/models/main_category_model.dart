import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/models/category_data.dart';

///Created by Naman Gupta on 5/11/22.

class MainCategoryModel {
  late List<MainCategoryDetail> mainCategoryList;

  MainCategoryModel() {
    mainCategoryList = [];
    createMainModel();
  }

  static List<SubCategoryDetail> getAccSubCategory() {
    List<SubCategoryDetail> list = [];
    SubCategoryDetail model_1 =
        SubCategoryDetail(SubCategoryData.FREE_RUN, Assets.CAR);
    SubCategoryDetail model_2 =
        SubCategoryDetail(SubCategoryData.THOR_HAMMER, Assets.CAR);
    SubCategoryDetail model_3 =
        SubCategoryDetail(SubCategoryData.SOCCER, Assets.CAR);
    SubCategoryDetail model_4 =
        SubCategoryDetail(SubCategoryData.OBSTACLE_AVOIDER, Assets.CAR);
    SubCategoryDetail model_5 =
        SubCategoryDetail(SubCategoryData.EDGE_DETECTOR, Assets.CAR);
    SubCategoryDetail model_6 =
        SubCategoryDetail(SubCategoryData.LINE_FOLLOWER, Assets.CAR);

    list.add(model_1);
    list.add(model_2);
    list.add(model_3);
    list.add(model_4);
    list.add(model_5);
    list.add(model_6);

    return list;
  }

  void createMainModel() {
    MainCategoryDetail accelero = MainCategoryDetail(CategoryData.ACCELEREO,
        Assets.CAR, MainCategoryModel.getAccSubCategory());
    mainCategoryList.add(accelero);

    MainCategoryDetail spaceRover = MainCategoryDetail(CategoryData.SPACE_ROVER,
        Assets.SPACE_ROVER, MainCategoryModel.getAccSubCategory());
    mainCategoryList.add(spaceRover);

    MainCategoryDetail machines = MainCategoryDetail(CategoryData.MACHINES,
        Assets.MACHINES, MainCategoryModel.getAccSubCategory());
    mainCategoryList.add(machines);

    MainCategoryDetail armyTank = MainCategoryDetail(CategoryData.ARNY_TANK,
        Assets.ARMY_TANK, MainCategoryModel.getAccSubCategory());
    mainCategoryList.add(armyTank);

    MainCategoryDetail intellecto = MainCategoryDetail(CategoryData.INTELLECTO,
        Assets.INTELLECTO, MainCategoryModel.getAccSubCategory());
    mainCategoryList.add(intellecto);
  }

  List<MainCategoryDetail> getMainCategoryModel() {
    return mainCategoryList;
  }
}

class MainCategoryDetail {
  late String title;
  late String image;
  late List<SubCategoryDetail> subCategoryDetailList;

  MainCategoryDetail(this.title, this.image, this.subCategoryDetailList);
}

class SubCategoryDetail {
  late String title;
  late String image;

  SubCategoryDetail(this.title, this.image);
}
