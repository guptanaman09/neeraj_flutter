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

  static const String BUZZER_SWITCH = "buzzer_switch";
  static const String AC_SWITCH = "ac_switch";
  static const String PUMP_SWITCH = "pump_switch";

  static const String SERVO_SWITCH = "servo_switch";
  static const String SERVO1_VALUE = "servoone_value";
  static const String SERVO2_VALUE = "servotwo_value";
  static const String SERVO3_VALUE = "servothree_value";
  static const String SERVO4_VALUE = "servofour_value";

  static const String RGB_SWITCH = "rgb_switch";
  static const String RGB_RED_VALUE = "rgb_red";
  static const String RGB_GREEN_VALUE = "rgb_green";
  static const String RGB_BLUE_VALUE = "rgb_blue";

  static const String PERSON_COUNTER_SWITCH = "person_counter_switch";
  static const String PERSONCOUNTER_SLIDER_VALUE =
      "person_counter_slider_value";
  static const String PERSON_COUNT = "person_count";
//===================online==============================
  static const String SMARTDUSTBINSWITCH_I = "smart_dustbin_switch_I";
  static const String SMARTDUSTBINSENSING_I = "smart_dustbin_sensing_I";
  static const String SMARTDUSTBINOPEN_I = "smart_dustbin_open_I";
  static const String IRONMAN_SWITCH_I = "iron_man_switch_I";
  static const String IRONMAN_RED_I = "iron_man_red_I";
  static const String IRONMAN_GREEN_I = "iron_man_green_I";
  static const String IRONMAN_BLUE_I = "iron_man_blue_I";
  static const String SMART_IRRIGATION_SWITCH_I = "smart_irrigation_switch_I";
  static const String SMART_IRRIGATION_THRESHOLD_I =
      "smart_irrigation_threshold_I";
  static const String SMART_IRRIGATION_DISPENSE_I =
      "smart_irrigation_dispense_I";
  static const String SMART_ALARM_SWITCH_I = "smart_alarm_switch_I";
  static const String SMART_ALARM_DARKNESS_I = "smart_alarm_darkness_I";
  static const String SMART_ALARM_DISTANCE_I = "smart_alarm_distance_I";
  static const String BURGLAR_ALARM_SWITCH_I = "burglar_alarm_switch_I";
  static const String BURGLAR_ALARM_DISTANCE_I = "burglar_alarm_distance_I";
  static const String SOAP_DISPENSER_SWITCH_I = "soap_dispenser_switch_I";
  static const String SOAP_DISPENSER_DISTANCE_I = "soap_dispenser_distance_I";
  static const String SOAP_DISPENSER_PERIOD_I = "soap_dispenser_period_I";
  static const String PET_FEDDER_SWITCH_I = "pet_switch_I";
  static const String PET_FEDDER_DISTANCE_I = "pet_distance_I";
  static const String PET_FEDDER_PERIOD_I = "pet_period_I";
  static const String AIRGUITAR_SWITCH_I = "air_switch_I";
  static const String DOORBELL_SWITCH_I = "doorbell_switch_I";
  static const String DOORBELL_VALUE_I = "doorbell_value_I";
  static const String LIGHTBASED_SWITCH_I = "light_based_switch_I";
  static const String LIGHTBASED_DARKNEDD_I = "light_based_darkness_I";
  static const String LIGHTBASED_RED_I = "light_based_red_I";
  static const String LIGHTBASED_GREEN_I = "light_based_green_I";
  static const String LIGHTBASED_BLUE_I = "light_based_blue_I";
  static const String GESTUREBASED_SWITCH_I = "gesture_based_switch_I";
  static const String GESTUREBASED_DARKNEDD_I = "gesture_based_darkness_I";
  static const String GESTUREBASED_RED_I = "gesture_based_red_I";
  static const String GESTUREBASED_GREEN_I = "gesture_based_green_I";
  static const String GESTUREBASED_BLUE_I = "gesture_based_blue_I";

  static const String SWITCHBASED_SWITCH_I = "switch_based_switch_I";
  static const String SWITCHBASED_RED_I = "switch_based_red_I";
  static const String SWITCHBASED_GREEN_I = "switch_based_green_I";
  static const String SWITCHBASED_BLUE_I = "switch_based_blue_I";

  static const String CLAPBASED_SWITCH_I = "clap_based_switch_I";
  static const String CLAPBASED_DARKNEDD_I = "clap_based_darkness_I";
  static const String CLAPBASED_RED_I = "clap_based_red_I";
  static const String CLAPBASED_GREEN_I = "clap_based_green_I";
  static const String CLAPBASED_BLUE_I = "clap_based_blue_I";

  static const String MOBILEBASED_SWITCH_I = "mobile_based_switch_I";
  static const String MOBILEBASED_RED_I = "mobile_based_red_I";
  static const String MOBILEBASED_GREEN_I = "mobile_based_green_I";
  static const String MOBILEBASED_BLUE_I = "mobile_based_blue_I";

  static const String BUZZER_SWITCH_I = "buzzer_switch_I";
  static const String AC_SWITCH_I = "ac_switch_I";
  static const String PUMP_SWITCH_I = "pump_switch_I";

  static const String SERVO_SWITCH_I = "servo_switch_I";
  static const String SERVO1_VALUE_I = "servoone_value_I";
  static const String SERVO2_VALUE_I = "servotwo_value_I";
  static const String SERVO3_VALUE_I = "servothree_value_I";
  static const String SERVO4_VALUE_I = "servofour_value_I";

  static const String RGB_SWITCH_I = "rgb_switch_I";
  static const String RGB_RED_VALUE_I = "rgb_red_I";
  static const String RGB_GREEN_VALUE_I = "rgb_green_I";
  static const String RGB_BLUE_VALUE_I = "rgb_blue_I";
  static const String PERSON_COUNTER_SWITCH_I = "person_counter_switch_I";
  static const String PERSONCOUNTER_SLIDER_VALUE_I =
      "person_counter_slider_value_I";
  static const String PERSON_COUNT_I = "person_count_I";
  static const String CONNECTEDWIFINAME = "connected_wifi_name";

  static const String PROXY_1_BLACK = "proxy_1_black";
  static const String PROXY_1_WHITE = "proxy_1_white";
  static const String PROXY_1_AVERAGE = "proxy_1_avg";

  static const String PROXY_2_BLACK = "proxy_2_black";
  static const String PROXY_2_WHITE = "proxy_2_white";
  static const String PROXY_2_AVERAGE = "proxy_2_avg";
  static const String SERIALRSSID = "serial_rssi";

  static const String FREERUN_REDSLIDER = "freerun_red_slider";
  static const String FREERUN_GREENSLIDER = "freerun_green_slider";
  static const String FREERUN_BLUESLIDER = "freerun_blue_slider";

  static const String FREERUN_DUMPSLIDER = "freerun_dump_slider";
  static const String FREERUN_SWINGSLIDER = "freerun_swing_slider";
  static const String FREERUN_BUCKETSLIDER = "freerun_bucket_slider";
  static const String FREERUN_BOONSLIDER = "freerun_boon_slider";
  static const String FREERUN_ARMSLIDER = "freerun_arm_slider";
  static setInt(String key, int value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setInt(key, value);
  }

  static Future<int> getInt(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getInt(key) ?? 0;
  }

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

  static Future<String> getString(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getString(key) ?? "";
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
