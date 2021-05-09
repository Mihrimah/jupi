import 'package:jupi/enum/horoscope_enum.dart';

class Horoscope{
  Horoscope(this.horoscopeEnum,this.startMonth, this.startDay, this.endMonth, this.endDay);

  HoroscopeEnum horoscopeEnum;
  int startMonth;
  int startDay;
  int endMonth;
  int endDay;
}