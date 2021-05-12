import 'dart:core';

import 'package:jupi/enum/horoscope_enum.dart';

class CompatibilityRequest {
  CompatibilityRequest(this.ownHoroscope, this.otherHoroscope);

  HoroscopeEnum ownHoroscope;
  HoroscopeEnum otherHoroscope;
}
