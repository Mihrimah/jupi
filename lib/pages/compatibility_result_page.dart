import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/compatibility_response.dart';
import 'package:jupi/model/horoscope.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/repository/firebase_repository.dart';
import 'package:provider/provider.dart';

class CompatibilityResultPage extends StatefulWidget {
  HoroscopeEnum ownHoroscope;
  HoroscopeEnum otherHoroscope;

  CompatibilityResultPage(this.ownHoroscope, this.otherHoroscope);

  @override
  _CompatibilityResultPageState createState() =>
      _CompatibilityResultPageState();
}

class _CompatibilityResultPageState extends State<CompatibilityResultPage> {
  late FirebaseRepository _firebaseRepository;
  CompatibilityResponse? _compatibilityResponse;
  bool isLoading = true;

  @override
  void initState() {
    _firebaseRepository = FirebaseRepository();
    super.initState();
    fetchComparedDetails(widget.ownHoroscope, widget.otherHoroscope);
  }

  void fetchComparedDetails(
      HoroscopeEnum ownHoroscope, HoroscopeEnum otherHoroscope) {
    _firebaseRepository
        .findComparedDetailsBetweenHoroscopesCollection(
            ownHoroscope, otherHoroscope)
        .then((value) {
      _compatibilityResponse = convertToTrueNodeDesc(value);
      setState(() {
        isLoading = false;
      });
    });
  }

  CompatibilityResponse convertToTrueNodeDesc(QuerySnapshot querySnapshot) {
    Map map = querySnapshot.docs[0].data()! as Map;
    return CompatibilityResponse(
        horoscopeEnumFromString(map['sign']),
        horoscopeEnumFromString(map['partner_sign']),
        map['description'],
        map['love_percentage']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Erkan"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Center(child: Text(widget.ownHoroscope.name())),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: AnimatedSwitcher(
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        child: child,
                        scale: animation,
                      );
                    },
                    duration: Duration(milliseconds: 5000),
                    child: Text(_compatibilityResponse == null
                        ? "%?"
                        : "%" +
                            _compatibilityResponse!.lovePercentage.toString()),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Center(child: Text(widget.otherHoroscope.name())),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text("Description",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Text(_compatibilityResponse == null
                      ? "Not found Description."
                      : _compatibilityResponse!.description)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
