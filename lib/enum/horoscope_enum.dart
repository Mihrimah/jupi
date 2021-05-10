enum HoroscopeEnum {
  Virgo,
  Libra,
  Scorpio,
  Sagittarius,
  Capricorn,
  Aquarius,
  Pisces,
  Aries,
  Taurus,
  Gemini,
  Cancer,
  Leo
}

extension EnumValue on HoroscopeEnum {
  String name() {
    return this.toString().split('.').last;
  }
}

HoroscopeEnum horoscopeEnumFromString(String value){
  return HoroscopeEnum.values.firstWhere((e)=>
  e.toString().split('.')[1].toUpperCase()==value.toUpperCase());
}