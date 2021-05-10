import 'dart:convert';
import 'dart:core';

import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/user_param.dart';

class User {
  User(this.name, this.dob, this.horoscope);

  String name;
  DateTime dob;
  HoroscopeEnum horoscope;

  static User of(UserParam userParam) {
    return User(userParam.name, userParam.dob, userParam.horoscope);
  }

  static String toJson(User user) {
    Map<String, dynamic> map = {
      'name': user.name,
      'dob': user.dob,
      'horoscope': user.horoscope,
    };
    return json.encode(map, toEncodable: myDateSerializer);
  }

  static User fromJson(data) {
    final myMap = json.decode(data);
    final name = myMap['name'];
    final dobString = myMap['dob'];
    final horoscopeString = myMap['horoscope'];
    final dob = DateTime.parse(dobString);
    final horoscopeEnum = horoscopeEnumFromString(horoscopeString);
    return User(name, dob, horoscopeEnum);
  }

  static dynamic myDateSerializer(dynamic object) {
    if (object is DateTime) {
      return object.toIso8601String();
    } else if (object is HoroscopeEnum) {
      return object.name();
    }
    return object;
  }
}
