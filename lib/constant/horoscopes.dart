import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';

class Constant {
  static Map<String, Horoscope > horoscopes = {
    HoroscopeEnum.Aquarius.name() : Horoscope(HoroscopeEnum.Aquarius, DateTime.april, 27),
  };
}
