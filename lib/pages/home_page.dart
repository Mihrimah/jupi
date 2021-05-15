import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jupi/core/line_paint.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/pages/dash_page.dart';
import 'package:jupi/pages/own_horoscope_page.dart';
import 'package:jupi/pages/profile_page.dart';
import 'package:provider/provider.dart';

import 'compatibility_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  CarouselController buttonCarouselController = CarouselController();
  GlobalKey mainKey = GlobalKey();
  GlobalKey child1Key = GlobalKey();
  GlobalKey child2Key = GlobalKey();
  GlobalKey child3Key = GlobalKey();
  GlobalKey child4Key = GlobalKey();

  late double mainCirclewidth;
  late double mainCircleheight;
  late double childCirclewidth;
  late double childCircleheight;
  bool reanimate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext v) {
    double width = MediaQuery.of(context).size.width;
    mainCirclewidth = width / 4;
    mainCircleheight = width / 4;

    double padding = width / 12;
    childCirclewidth = width / 5;
    childCircleheight = width / 5;

    return Scaffold(
      appBar: AppBar(
        title: Text("jupi"),
      ),
      body: Stack(
        children: [
          LinePaint(mainCirclewidth, childCirclewidth, padding, mainKey,
              child1Key, child2Key, child3Key, child4Key, context, reanimate),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DashPage(Provider.of<User>(context))),
                      ).then((value) {
                        setState(() {
                          reanimate = !reanimate;
                        });
                      });
                    },
                    child: Container(
                      key: child1Key,
                      width: childCirclewidth,
                      height: childCircleheight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/home.png')),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(100.0)),
                        border: new Border.all(
                          color: Colors.orange,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    key: child2Key,
                    width: childCirclewidth,
                    height: childCircleheight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/instagram.png')),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(100.0)),
                      border: new Border.all(
                        color: Colors.grey,
                        width: 3.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OwnHoroscopePage()),
                        ).then((value) {
                          setState(() {
                            reanimate = !reanimate;
                          });
                        });
                      },
                      child: Container(
                        key: mainKey,
                        width: mainCirclewidth,
                        height: mainCircleheight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/pisces3.jpg')),
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(100.0)),
                          border: new Border.all(
                            color: Colors.lightBlueAccent,
                            width: 11.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompatibilityPage()),
                      ).then((value) {
                        setState(() {
                          reanimate = !reanimate;
                        });
                      });
                    },
                    child: Container(
                      key: child3Key,
                      width: childCirclewidth,
                      height: childCircleheight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/compareperson.jpg')),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(100.0)),
                        border: new Border.all(
                          color: Colors.purple,
                          width: 3.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      ).then((value) {
                        setState(() {
                          reanimate = !reanimate;
                        });
                      });
                    },
                    child: Container(
                      key: child4Key,
                      width: childCirclewidth,
                      height: childCircleheight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/user.png')),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(100.0)),
                        border: new Border.all(
                          color: Colors.red,
                          width: 3.0,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}