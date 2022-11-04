import 'package:shared_preferences/shared_preferences.dart';

///Created by Naman Gupta on 19/4/21.

class MySharedPreference {
  static const String STORED_LANGUAGE = "stored_language";
  static const String IS_LOGGED_IN = "is_logged_in";

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

  static Future<bool?> getBoolean(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getBool(key);
  }

  static clearAllData() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.clear();
  }
}
