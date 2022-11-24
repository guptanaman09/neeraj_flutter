import 'package:shared_preferences/shared_preferences.dart';

///Created by Naman Gupta on 19/4/21.

class MySharedPreference {
  static const String STORED_LANGUAGE = "stored_language";
  static const String IS_LOGGED_IN = "is_logged_in";
  static const String SMARTDUSTBINSWITCH = "smart_dustbin_switch";
  static const String SMARTDUSTBINSENSING = "smart_dustbin_sensing";
  static const String SMARTDUSTBINOPEN = "smart_dustbin_open";
  static const String IRONMAN_SWITCH = "iron_man_switch";
  static const String IRONMAN_RED = "iron_man_red";
  static const String IRONMAN_GREEN = "iron_man_green";
  static const String IRONMAN_BLUE = "iron_man_blue";
  static const String SMART_IRRIGATION_SWITCH = "smart_irrigation_switch";
  static const String SMART_IRRIGATION_THRESHOLD = "smart_irrigation_threshold";
  static const String SMART_IRRIGATION_DISPENSE = "smart_irrigation_dispense";
  static const String SMART_ALARM_SWITCH = "smart_alarm_switch";
  static const String SMART_ALARM_DARKNESS = "smart_alarm_darkness";
  static const String SMART_ALARM_DISTANCE = "smart_alarm_distance";
  static const String BURGLAR_ALARM_SWITCH = "burglar_alarm_switch";
  static const String BURGLAR_ALARM_DISTANCE = "burglar_alarm_distance";
  static const String SOAP_DISPENSER_SWITCH = "soap_dispenser_switch";
  static const String SOAP_DISPENSER_DISTANCE = "soap_dispenser_distance";
  static const String SOAP_DISPENSER_PERIOD = "soap_dispenser_period";
  static const String PET_FEDDER_SWITCH = "pet_switch";
  static const String PET_FEDDER_DISTANCE = "pet_distance";
  static const String PET_FEDDER_PERIOD = "pet_period";
  static const String AIRGUITAR_SWITCH = "air_switch";
  static const String DOORBELL_SWITCH = "doorbell_switch";
  static const String DOORBELL_VALUE = "doorbell_value";
  static const String LIGHTBASED_SWITCH = "light_based_switch";
  static const String LIGHTBASED_DARKNEDD = "light_based_darkness";
  static const String LIGHTBASED_RED = "light_based_red";
  static const String LIGHTBASED_GREEN = "light_based_green";
  static const String LIGHTBASED_BLUE = "light_based_blue";
  static const String GESTUREBASED_SWITCH = "gesture_based_switch";
  static const String GESTUREBASED_DARKNEDD = "gesture_based_darkness";
  static const String GESTUREBASED_RED = "gesture_based_red";
  static const String GESTUREBASED_GREEN = "gesture_based_green";
  static const String GESTUREBASED_BLUE = "gesture_based_blue";

  static const String SWITCHBASED_SWITCH = "switch_based_switch";
  static const String SWITCHBASED_RED = "switch_based_red";
  static const String SWITCHBASED_GREEN = "switch_based_green";
  static const String SWITCHBASED_BLUE = "switch_based_blue";

  static const String CLAPBASED_SWITCH = "clap_based_switch";
  static const String CLAPBASED_DARKNEDD = "clap_based_darkness";
  static const String CLAPBASED_RED = "clap_based_red";
  static const String CLAPBASED_GREEN = "clap_based_green";
  static const String CLAPBASED_BLUE = "clap_based_blue";

  static const String MOBILEBASED_SWITCH = "mobile_based_switch";
  static const String MOBILEBASED_RED = "mobile_based_red";
  static const String MOBILEBASED_GREEN = "mobile_based_green";
  static const String MOBILEBASED_BLUE = "mobile_based_blue";
  static setDouble(String key, double value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setDouble(key, value);
  }

  static Future<double> getDouble(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getDouble(key) ?? 0;
  }

  static setString(String key, String value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  static setBoolean(String key, bool value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getBool(key) ?? false;
  }

  static setSmartDustbinSwitch(bool value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setBool(SMARTDUSTBINSWITCH, value);
  }

  static Future<bool> getSmartDustbinSwitch() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getBool(SMARTDUSTBINSWITCH) ?? false;
  }

  static setSmartDustbinSensing(double value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setDouble(SMARTDUSTBINSENSING, value);
  }

  static Future<double> getSmartDustbinSensing() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getDouble(SMARTDUSTBINSENSING) ?? 0;
  }

  static setSmartDustbinOpen(double value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setDouble(SMARTDUSTBINOPEN, value);
  }

  static Future<double> getSmartDustbinOpen() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getDouble(SMARTDUSTBINOPEN) ?? 0;
  }

  static clearAllData() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.clear();
  }
}
