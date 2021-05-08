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
/*
Virgo: August 24 – September 23
Libra: September 24 – October 23
Scorpio: October 24 – November 22
Sagittarius: November 23 – December 21
Capricorn: December 22- January 20
Aquarius: January 21 – February 19
Pisces: February 20 – March 20
Aries: March 21- April 20
Taurus: April 21 – May 21
Gemini: May 22 – June 21
Cancer: June 22 – July 23
Leo: July 24 – August 23
*/
