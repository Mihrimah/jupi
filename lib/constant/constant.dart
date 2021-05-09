import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';

class Constant {
  static Map<String, Horoscope> horoscopes = {
    HoroscopeEnum.Virgo.name(): Horoscope(HoroscopeEnum.Virgo, DateTime.august, 24, DateTime.september, 23),
    HoroscopeEnum.Libra.name(): Horoscope(HoroscopeEnum.Libra, DateTime.september, 24, DateTime.october, 23),
    HoroscopeEnum.Scorpio.name(): Horoscope(HoroscopeEnum.Scorpio, DateTime.october, 24, DateTime.november, 22),
    HoroscopeEnum.Sagittarius.name(): Horoscope(HoroscopeEnum.Sagittarius,DateTime.november, 23, DateTime.december, 21),
    HoroscopeEnum.Capricorn.name(): Horoscope(HoroscopeEnum.Capricorn, DateTime.december, 22, DateTime.january, 20),
    HoroscopeEnum.Aquarius.name(): Horoscope(HoroscopeEnum.Aquarius, DateTime.january, 21, DateTime.february, 19),
    HoroscopeEnum.Pisces.name(): Horoscope(HoroscopeEnum.Pisces, DateTime.february, 20, DateTime.march, 20),
    HoroscopeEnum.Aries.name(): Horoscope(HoroscopeEnum.Aries, DateTime.march, 21, DateTime.april, 20),
    HoroscopeEnum.Taurus.name(): Horoscope(HoroscopeEnum.Taurus, DateTime.april, 21, DateTime.may, 21),
    HoroscopeEnum.Gemini.name(): Horoscope(HoroscopeEnum.Gemini, DateTime.may, 22, DateTime.june, 21),
    HoroscopeEnum.Cancer.name(): Horoscope(HoroscopeEnum.Cancer, DateTime.june, 22, DateTime.july, 23),
    HoroscopeEnum.Leo.name(): Horoscope(HoroscopeEnum.Leo, DateTime.july, 24, DateTime.august, 23),
  };

  static Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December'
  };
}
