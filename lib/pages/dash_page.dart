import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jupi/constant/true_node_constant.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';
import 'package:jupi/model/true_node.dart';
import 'package:jupi/model/true_node_desc.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/repository/firebase_repository.dart';
import 'package:provider/provider.dart';

class DashPage extends StatefulWidget {
  DashPage(this.user);

  User user;

  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  CarouselController buttonCarouselController = CarouselController();

  late HoroscopeEnum trueNodeHoroscope;
  bool isLoading = true;
  late TrueNodeDesc trueNodeDesc;

  late FirebaseRepository _firebaseRepository;

  @override
  void initState() {
    super.initState();
    _firebaseRepository = FirebaseRepository();
    trueNodeHoroscope = findTrueNode();
    fetchDetails(trueNodeHoroscope);
  }

  TrueNodeDesc convertToTrueNodeDesc(QuerySnapshot querySnapshot) {
    Map map = querySnapshot.docs[0].data()! as Map;
    return TrueNodeDesc(
        horoscopeEnumFromString(map['name']),
        map['info'],
        map['love'],
        map['overall'],
        map['work']);
  }

  void fetchDetails(HoroscopeEnum horoscope) {
    _firebaseRepository
        .findTrueNodeDescriptionByHoroscopeCollection(horoscope)
        .then((value) {
      trueNodeDesc = convertToTrueNodeDesc(value);
      setState(() {
        isLoading = false;
      });
    });
}

  HoroscopeEnum findTrueNode() {
    for (TrueNode t in TrueNodeConstant.TRUE_NODES) {
      if (t.start.isBefore(widget.user.dob) && t.end.isAfter(widget.user.dob)) {
        return t.sign;
      }
    }
    throw new Exception("not found True node Horoscope");
  }

  Widget progressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kadgad"),
      ),
      body: isLoading
          ? progressIndicator()
          : ListView(shrinkWrap: true, children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Info",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        trueNodeDesc.info,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Text(
                      "Love",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        trueNodeDesc.love,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Text(
                      "Overall",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        trueNodeDesc.overall,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Text(
                      "Work",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        trueNodeDesc.work,
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                    /*CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(height: 200.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Column(children: [
                      Text(
                        Provider.of<User>(context).name,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        Provider.of<User>(context).dob.toIso8601String(),
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        Provider.of<User>(context).horoscope.toString(),
                        style: TextStyle(fontSize: 16.0),
                      )
                    ],));
              },
            );
          }).toList(),
            )*/
                  ],
                ),
              ),
            ]),
    );
  }
}
