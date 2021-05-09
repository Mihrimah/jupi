import 'package:jupi/constant/constant.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';

class Util{

  static HoroscopeEnum getHoroscope(DateTime val) {
    late HoroscopeEnum horoscopeEnum;
    for(Horoscope horoscope in Constant.horoscopes.values) {
      if(horoscope.startMonth == val.month && horoscope.startDay <= val.day) {
        horoscopeEnum = horoscope.horoscopeEnum;
        break;
      } else if(horoscope.endMonth == val.month && horoscope.startDay >= val.day) {
        horoscopeEnum = horoscope.horoscopeEnum;
        break;
      }
    }
    return horoscopeEnum;
  }
}