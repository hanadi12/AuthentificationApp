import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class RememberUserPrefs {
  // save user info
  static Future<void> storeUserInfo(User userInfo) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await prefrences.setString("currentUser", userJsonData);
  }

  // get  read user info

  static Future<User?> readUserInfo() async {
    User? currentUserInfo;
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    String? userInfo = prefrences.getString("currentUser");

    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }

  static Future<void> removeUserInfo() async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    await prefrences.remove("currentUser");
  }
}
