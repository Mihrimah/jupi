import 'dart:convert';

import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {

  addUserData(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("USERDATA",User.toJson(user));
  }

  Future<User?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("USERDATA");
    if (data != null) {
      User user = User.fromJson(data);
      return Future.value(user);
    }
    return Future.value(null);
  }
}
