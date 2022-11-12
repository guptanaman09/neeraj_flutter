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
    SubCategoryDetail model_1 = SubCategoryDetail(
        SubCategoryData.FREE_RUN, Assets.FREE_RUN, CategoryData.ACCELEREO);
    SubCategoryDetail model_2 = SubCategoryDetail(SubCategoryData.THOR_HAMMER,
        Assets.THOR_HAMMER, CategoryData.ACCELEREO);
    SubCategoryDetail model_3 = SubCategoryDetail(
        SubCategoryData.SOCCER, Assets.SOCCER, CategoryData.ACCELEREO);
    SubCategoryDetail model_4 = SubCategoryDetail(
        SubCategoryData.OBSTACLE_AVOIDER,
        Assets.OBSTACLE_PROVIDER,
        CategoryData.ACCELEREO);
    SubCategoryDetail model_5 = SubCategoryDetail(SubCategoryData.EDGE_DETECTOR,
        Assets.EDGE_DETECTOR_ACC, CategoryData.ACCELEREO);
    SubCategoryDetail model_6 = SubCategoryDetail(SubCategoryData.LINE_FOLLOWER,
        Assets.LINE_FOLLOWER, CategoryData.ACCELEREO);

    list.add(model_1);
    list.add(model_2);
    list.add(model_3);
    list.add(model_4);
    list.add(model_5);
    list.add(model_6);

    return list;
  }

  static List<SubCategoryDetail> getSpaceRoverSubCategory() {
    List<SubCategoryDetail> list = [];
    SubCategoryDetail model_1 = SubCategoryDetail(
        SubCategoryData.FREE_RUN, Assets.FREE_RUNN, CategoryData.SPACE_ROVER);
    SubCategoryDetail model_2 = SubCategoryDetail(
        SubCategoryData.RADAR, Assets.RADAR, CategoryData.SPACE_ROVER);
    SubCategoryDetail model_3 = SubCategoryDetail(
        SubCategoryData.OBSTACLE_AVOIDER,
        Assets.OBSTACLE_AVOIDER,
        CategoryData.SPACE_ROVER);
    SubCategoryDetail model_4 = SubCategoryDetail(SubCategoryData.EDGE_DETECTOR,
        Assets.EDGE_DETECTOR, CategoryData.SPACE_ROVER);

    list.add(model_1);
    list.add(model_2);
    list.add(model_3);
    list.add(model_4);

    return list;
  }

  static List<SubCategoryDetail> getMachinesSubCategory() {
    List<SubCategoryDetail> list = [];
    SubCategoryDetail model_1 = SubCategoryDetail(
        SubCategoryData.ROLLER, Assets.ROAD_ROLLER, CategoryData.MACHINES);
    SubCategoryDetail model_2 = SubCategoryDetail(
        SubCategoryData.DUMPER, Assets.DUMPER, CategoryData.MACHINES);
    SubCategoryDetail model_3 = SubCategoryDetail(
        SubCategoryData.FORKLIFT, Assets.FORKLIFT, CategoryData.MACHINES);
    SubCategoryDetail model_4 = SubCategoryDetail(
        SubCategoryData.CRANE, Assets.CRANE, CategoryData.MACHINES);
    SubCategoryDetail model_5 = SubCategoryDetail(
        SubCategoryData.CATAPULT, Assets.CATAPULT, CategoryData.MACHINES);
    SubCategoryDetail model_6 = SubCategoryDetail(SubCategoryData.BALL_SHOOTER,
        Assets.BALL_SHOOTER, CategoryData.MACHINES);
    SubCategoryDetail model_7 = SubCategoryDetail(
        SubCategoryData.EXCAVATOR, Assets.EXAVATOR, CategoryData.MACHINES);

    list.add(model_1);
    list.add(model_2);
    list.add(model_3);
    list.add(model_4);
    list.add(model_5);
    list.add(model_6);
    list.add(model_7);

    return list;
  }

  static List<SubCategoryDetail> getArmyTankkSubCategory() {
    List<SubCategoryDetail> list = [];
    SubCategoryDetail model_1 = SubCategoryDetail(
        CategoryData.ARNY_TANK, Assets.ARMY_TANK, CategoryData.ARNY_TANK);

    list.add(model_1);

    return list;
  }

  void createMainModel() {
    MainCategoryDetail accelero = MainCategoryDetail(CategoryData.ACCELEREO,
        Assets.CAR, MainCategoryModel.getAccSubCategory());
    mainCategoryList.add(accelero);

    MainCategoryDetail spaceRover = MainCategoryDetail(CategoryData.SPACE_ROVER,
        Assets.SPACE_ROVER, MainCategoryModel.getSpaceRoverSubCategory());
    mainCategoryList.add(spaceRover);

    MainCategoryDetail machines = MainCategoryDetail(CategoryData.MACHINES,
        Assets.MACHINES, MainCategoryModel.getMachinesSubCategory());
    mainCategoryList.add(machines);

    MainCategoryDetail armyTank = MainCategoryDetail(CategoryData.ARNY_TANK,
        Assets.ARMY_TANK, MainCategoryModel.getArmyTankkSubCategory());
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
  late String mainCategoryTitle;

  SubCategoryDetail(this.title, this.image, this.mainCategoryTitle);
}
