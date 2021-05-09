import 'dart:core';

import 'package:jupi/enum/horoscope_enum.dart';

class User{

  User(this.name, this.dob, this.horoscope);

  String name;
  DateTime dob;
  HoroscopeEnum horoscope;

}

