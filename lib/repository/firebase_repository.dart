import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jupi/enum/horoscope_enum.dart';


class FirebaseRepository {
  final CollectionReference trueNodeDescriptionsCollection =
      FirebaseFirestore.instance.collection("true_node_descriptions");

  final CollectionReference loveCompatibilityCollection =
      FirebaseFirestore.instance.collection("love_compability");

  Future<QuerySnapshot> findTrueNodeDescriptionByHoroscopeCollection(HoroscopeEnum horoscope) {
    return trueNodeDescriptionsCollection
        .where("name", isEqualTo: horoscope.name()).snapshots().first;
  }

  Future<QuerySnapshot> findComparedDetailsBetweenHoroscopesCollection(HoroscopeEnum ownHoroscope, HoroscopeEnum otherHoroscope) {
    return loveCompatibilityCollection
        .where("sign", isEqualTo: ownHoroscope.name())
        .where("partner_sign", isEqualTo: otherHoroscope.name()).snapshots().first;
  }
}
