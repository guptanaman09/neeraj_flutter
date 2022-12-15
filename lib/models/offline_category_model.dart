///Created by Naman Gupta on 6/11/22.

import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/models/category_data.dart';
import 'package:neeraj_flutter_app/models/offline_data.dart';

import 'offline_screen_data.dart';

///Created by Naman Gupta on 5/11/22.

class OfflineCategoryModel {
  late List<OfflineMainCategoryDetail> mainCategoryList;

  OfflineCategoryModel(OfflineGamePlayType data) {
    mainCategoryList = [];
    createMainModel(data);
  }

  static List<OfflineSubCategoryDetail> getStructureBasedSubCategory(
      OfflineGamePlayType data) {
    List<OfflineSubCategoryDetail> list = [];
    OfflineSubCategoryDetail model_1 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.APPLIANCE_CONTROL,
        Assets.APPLIANCE_CONTROL,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_2 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SMART_DUSTBIN,
        Assets.SMART_DUSTBIN,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_3 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.IRON_MAN_HAND,
        Assets.IRON_MAN_HAND,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_4 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SMART_IRRIGATION,
        Assets.SMART_IRRIGATION,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_5 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SMART_ALARM,
        Assets.SMART_ALARM,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_6 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.BURGLAR_ALARM,
        Assets.BURGLAR_ALARM,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_7 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.MAGIC_DANCING_DOLL,
        Assets.MAGIC_DANCING_DOLL,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_8 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SOAP_DISPENSOR,
        Assets.SOAP_DISPANSOR,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_9 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.PET_FEEDER,
        Assets.PET_FEEDER,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_10 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.AIR_GUITAR,
        Assets.AIR_GUITAR,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_11 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SMART_LAMP,
        Assets.SMART_LAMP,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_12 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.PERSON_COUNTER,
        Assets.PERSON_COUNTER,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    OfflineSubCategoryDetail model_13 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.TOUCHLESS_DOORBELL,
        Assets.TOUCHLESS_DOORBELL,
        OfflineData.STRUCTURED_BASED_ACTIVTIES);
    // OfflineSubCategoryDetail model_14 = OfflineSubCategoryDetail(
    //     OfflineSubCategoryData.IOT_CLOUD,
    //     Assets.IOT_CLOUD,
    //     OfflineData.STRUCTURED_BASED_ACTIVTIES);

    list.add(model_1);
    list.add(model_2);
    list.add(model_3);
    list.add(model_4);
    list.add(model_5);
    list.add(model_6);
    if (data == OfflineGamePlayType.OFFLINE) {
      list.add(model_7);
    }

    list.add(model_8);
    list.add(model_9);
    list.add(model_10);
    list.add(model_11);
    list.add(model_12);
    list.add(model_13);
    //  list.add(model_14);

    return list;
  }

  static List<OfflineSubCategoryDetail> getMotorOutputSubCategory() {
    List<OfflineSubCategoryDetail> list = [];
    OfflineSubCategoryDetail model_1 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.BUZZER,
        Assets.BUZZER,
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS);
    OfflineSubCategoryDetail model_2 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.AC_RELAY,
        Assets.AC_RELAY,
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS);
    OfflineSubCategoryDetail model_3 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SERVO_DRIVER,
        Assets.SERVO_DRIVER,
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS);
    OfflineSubCategoryDetail model_4 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.RGB_LED,
        Assets.RGB_LED,
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS);
    OfflineSubCategoryDetail model_5 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.PUMP_DRIVER,
        Assets.PUMP_DRIVER,
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS);
    OfflineSubCategoryDetail model_6 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.MOTOR_DRIVER,
        Assets.MOTOR_DRIVER,
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS);

    list.add(model_1);
    list.add(model_2);
    list.add(model_3);
    list.add(model_4);
    list.add(model_5);
    list.add(model_6);

    return list;
  }

  static List<OfflineSubCategoryDetail> getSensorsSubCategory() {
    List<OfflineSubCategoryDetail> list = [];
    OfflineSubCategoryDetail model_1 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.PRXIMITY_SENSOR,
        Assets.PROXIMITY_SENSOR,
        OfflineData.SENSONRS_AND_INPUT_BLOCKS);
    OfflineSubCategoryDetail model_2 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.WEATHOR_SENSOR,
        Assets.WEATHOR_SENSOR,
        OfflineData.SENSONRS_AND_INPUT_BLOCKS);
    OfflineSubCategoryDetail model_3 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SOUND_SENSOR,
        Assets.SOUND_SENSOR,
        OfflineData.SENSONRS_AND_INPUT_BLOCKS);
    // OfflineSubCategoryDetail model_4 = OfflineSubCategoryDetail(
    //     OfflineSubCategoryData.MOTION_SENSOR,
    //     Assets.MOTION_SENSOR,
    //     OfflineData.SENSONRS_AND_INPUT_BLOCKS);
    OfflineSubCategoryDetail model_5 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.ULTRASONIC_SENSOR,
        Assets.ULTRASONIC_SENSOR,
        OfflineData.SENSONRS_AND_INPUT_BLOCKS);
    OfflineSubCategoryDetail model_6 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.SOIL_MOISTURE_SENSOR,
        Assets.SOIL_MOISTURE_SENSOR,
        OfflineData.SENSONRS_AND_INPUT_BLOCKS);

    OfflineSubCategoryDetail model_7 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.LIGHT_SENSOR,
        Assets.LIGHT_SENSOR,
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS);

    OfflineSubCategoryDetail model_8 = OfflineSubCategoryDetail(
        OfflineSubCategoryData.PUSH_SWITCH,
        Assets.PUSH_SWITCH,
        OfflineData.SENSONRS_AND_INPUT_BLOCKS);

    list.add(model_1);
    list.add(model_2);
    list.add(model_3);
    //  list.add(model_4);
    list.add(model_5);
    list.add(model_6);
    list.add(model_7);
    list.add(model_8);

    return list;
  }

  void createMainModel(OfflineGamePlayType data) {
    OfflineMainCategoryDetail accelero = OfflineMainCategoryDetail(
        OfflineData.STRUCTURED_BASED_ACTIVTIES,
        Assets.STRUCTURED_BASED_ACTIVITY,
        OfflineCategoryModel.getStructureBasedSubCategory(data));
    mainCategoryList.add(accelero);

    OfflineMainCategoryDetail spaceRover = OfflineMainCategoryDetail(
        OfflineData.MOTORS_AND_OUTPUT_BLOCKS,
        Assets.MOTOR_AND_OUTPUT,
        OfflineCategoryModel.getMotorOutputSubCategory());
    mainCategoryList.add(spaceRover);

    OfflineMainCategoryDetail machines = OfflineMainCategoryDetail(
        OfflineData.SENSONRS_AND_INPUT_BLOCKS,
        Assets.SENSOR_INPUT_BLOCKS,
        OfflineCategoryModel.getSensorsSubCategory());
    mainCategoryList.add(machines);
  }

  List<OfflineMainCategoryDetail> getMainCategoryModel() {
    return mainCategoryList;
  }
}

class OfflineMainCategoryDetail {
  late String title;
  late String image;
  late List<OfflineSubCategoryDetail> subCategoryDetailList;

  OfflineMainCategoryDetail(this.title, this.image, this.subCategoryDetailList);
}

class OfflineSubCategoryDetail {
  late String title;
  late String image;
  late String mainCategoryTitle;

  OfflineSubCategoryDetail(this.title, this.image, this.mainCategoryTitle);
}
