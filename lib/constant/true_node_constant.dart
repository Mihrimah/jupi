import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';
import 'package:jupi/model/true_node.dart';

class TrueNodeConstant {
  static List<TrueNode> TRUE_NODES = [
    TrueNode(
        HoroscopeEnum.Taurus, DateTime(2000, 08, 11), DateTime(2042, 02, 03)),
    TrueNode(
        HoroscopeEnum.Virgo, DateTime(1978, 07, 06), DateTime(1980, 01, 12)),
  ];
}
