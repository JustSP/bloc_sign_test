// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  Future<bool> setSignInToken(String token) async {
    try {
      SharedPreferences _spInstance = await SharedPreferences.getInstance();

      return _spInstance.setString("signInToken", token);
    } catch (ex) {
      //print(ex);
      return false;
    }
  }

  Future<String> getSignInToken() async {
    try {
      SharedPreferences _spInstance = await SharedPreferences.getInstance();

      return _spInstance.getString("signInToken") ?? "";
    } catch (ex) {
      //print(ex);
      return "";
    }
  }

  Future<bool> clearData() async {
    try {
      SharedPreferences _spInstance = await SharedPreferences.getInstance();

      return _spInstance.clear();
    } catch (ex) {
      //print(ex);
      return false;
    }
  }
}
