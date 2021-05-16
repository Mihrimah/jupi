import 'dart:core';

import 'package:jupi/enum/horoscope_enum.dart';

class CompatibilityResponse {
  CompatibilityResponse(this.ownHoroscope, this.otherHoroscope, this.description, this.lovePercentage);

  HoroscopeEnum ownHoroscope;
  HoroscopeEnum otherHoroscope;
  String description;
  int lovePercentage;

}
