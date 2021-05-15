import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/pages/dash_page.dart';
import 'package:jupi/pages/own_horoscope_page.dart';
import 'package:provider/provider.dart';
import 'package:touchable/touchable.dart';

import 'compatibility_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  onTapNavigate(name) {
    if (name == "erkan") {
      print("erkan nav");
    } else if (name == "erkan1") {
      print("erkan1 nav");
    }
  }

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
          CanvasTouchDetector(
              builder: (context) => CustomPaint(
                    painter: LinePainter(
                        mainCirclewidth,
                        childCirclewidth,
                        padding,
                        mainKey,
                        child1Key,
                        child2Key,
                        child3Key,
                        child4Key,
                        context),
                  )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashPage(Provider.of<User>(context))),
                      );
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
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OwnHoroscopePage()),
                        );
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompatibilityPage()),
                      );
                    },
                    child: Container(
                      key: child3Key,
                      width: childCirclewidth,
                      height: childCircleheight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/compareperson.jpg')),
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
                  Container(
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

class LinePainter extends CustomPainter {
  LinePainter(
      this.mainCirclewidth,
      this.childCirclewidth,
      this.padding,
      this.mainKey,
      this.child1Key,
      this.child2Key,
      this.child3Key,
      this.child4Key,
      this.context);

  final BuildContext context;
  double mainCirclewidth;
  double childCirclewidth;
  double padding;

  GlobalKey mainKey;
  GlobalKey child1Key;
  GlobalKey child2Key;
  GlobalKey child3Key;
  GlobalKey child4Key;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;
    var myCanvas = TouchyCanvas(context, canvas);
    double reducedHeight = MediaQueryData.fromWindow(window).padding.top + 56.0;

    RenderBox? box = mainKey.currentContext!.findRenderObject() as RenderBox;
    Offset mainPosition = box.localToGlobal(Offset.zero);

    RenderBox? child1 =
        child1Key.currentContext!.findRenderObject() as RenderBox;
    Offset child1Position = child1.localToGlobal(Offset.zero);

    RenderBox? child2 =
        child2Key.currentContext!.findRenderObject() as RenderBox;
    Offset child2Position = child2.localToGlobal(Offset.zero);

    RenderBox? child3 =
        child3Key.currentContext!.findRenderObject() as RenderBox;
    Offset child3Position = child3.localToGlobal(Offset.zero);

    RenderBox? child4 =
        child4Key.currentContext!.findRenderObject() as RenderBox;
    Offset child4Position = child4.localToGlobal(Offset.zero);

    myCanvas.drawLine(
        Offset(mainPosition.dx + mainCirclewidth / 2,
            mainPosition.dy - reducedHeight),
        Offset(child1Position.dx + childCirclewidth / 2,
            child1Position.dy + childCirclewidth - reducedHeight),
        paint);

    myCanvas.drawLine(
        Offset(mainPosition.dx,
            mainPosition.dy + mainCirclewidth / 2 - reducedHeight),
        Offset(child2Position.dx + childCirclewidth,
            child2Position.dy + childCirclewidth / 2 - reducedHeight),
        paint);

    myCanvas.drawLine(
        Offset(mainPosition.dx + mainCirclewidth,
            mainPosition.dy + mainCirclewidth / 2 - reducedHeight),
        Offset(child3Position.dx,
            child3Position.dy + childCirclewidth / 2 - reducedHeight),
        paint);

    myCanvas.drawLine(
        Offset(mainPosition.dx + mainCirclewidth / 2,
            mainPosition.dy + mainCirclewidth - reducedHeight),
        Offset(child4Position.dx + childCirclewidth / 2,
            child4Position.dy - reducedHeight),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
