import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/util/util.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    final util = Util();
    HoroscopeEnum horoscopeEnum = util.getHoroscope(DateTime(1992,03,07));
    expect(horoscopeEnum.name(), HoroscopeEnum.Pisces.name());
  });

  test('Counter value should be incremented', () {
    final util = Util();
    HoroscopeEnum horoscopeEnum = util.getHoroscope(DateTime(1991,01,27));
    expect(horoscopeEnum.name(), HoroscopeEnum.Aquarius.name());
  });

  test('Counter value should be incremented', () {
    final util = Util();
    HoroscopeEnum horoscopeEnum = util.getHoroscope(DateTime(1991,07,09));
    expect(horoscopeEnum.name(), HoroscopeEnum.Cancer.name());
  });

  test('Counter value should be incremented', () {
    final util = Util();
    HoroscopeEnum horoscopeEnum = util.getHoroscope(DateTime(1959,01,01));
    expect(horoscopeEnum.name(), HoroscopeEnum.Capricorn.name());
  });
}