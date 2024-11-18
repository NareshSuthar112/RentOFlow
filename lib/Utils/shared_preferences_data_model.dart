import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataModel {

  static var isLogin = "isLogin";

  static Future<void> writeStringData(var key,var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String?> readStringData(var key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> writeBoolData(var key,var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool?> readBoolData(var key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}