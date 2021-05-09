import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';

class Constant {
  static Map<String, Horoscope > horoscopes = {
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Virgo, DateTime.august, 24, DateTime.september, 23),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Libra, DateTime.september, 24, DateTime.october, 23),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Scorpio, DateTime.october, 24, DateTime.november, 22),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Sagittarius, DateTime.november, 23, DateTime.december, 21),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Capricorn, DateTime.december, 22, DateTime.january, 20),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Aquarius, DateTime.january, 21, DateTime.february, 19),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Pisces, DateTime.february, 20, DateTime.march, 20),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Aries, DateTime.march, 21, DateTime.april, 20),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Taurus, DateTime.april, 21, DateTime.may, 21),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Gemini, DateTime.may, 22, DateTime.june, 21),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Cancer, DateTime.june, 22, DateTime.july, 23),
    HoroscopeEnum.Virgo.name() : Horoscope(HoroscopeEnum.Leo, DateTime.july, 24, DateTime.august, 23),
  };
}
