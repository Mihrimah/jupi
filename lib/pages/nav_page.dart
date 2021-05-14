import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touchable/touchable.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  CarouselController buttonCarouselController = CarouselController();
  late ui.Image image;
  bool isImageloaded = false;



  Future <Null> init() async {
    final ByteData data = await rootBundle.load('assets/images/pisces.png');
    image = await loadImage(new Uint8List.view(data.buffer));
  }

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  onTapNavigate(name) {
    if (name == "erkan") {
      print("erkan nav");
    } else if (name == "erkan1") {
      print("erkan1 nav");
    }
  }

  @override
  void initState() {
    init();
  }

  @override
  Widget build(BuildContext v) {
    if (this.isImageloaded) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height -
          56 -
          56; //reduced appbar and navbar

      double middlex = width / 2;
      double middley = height / 2;
      double mainRadius = middlex / 4;

      return CanvasTouchDetector(
          builder: (context) => CustomPaint(
                painter: NavCircles(
                    middlex - (mainRadius * 2),
                    middley,
                    middlex - (mainRadius + (mainRadius / 2)),
                    middley,
                    middlex - mainRadius,
                    middley,
                    mainRadius / 2,
                    middlex,
                    middley,
                    mainRadius,
                    context,
                    onTapNavigate,
                    image),
              ));
    } else {
      return new Center(child: new Text('loading'));
    }
  }
}

class NavCircles extends CustomPainter {
  NavCircles(
      this.dx,
      this.dy,
      this.dxLine,
      this.dyLine,
      this.dxLineTo,
      this.dyLineTo,
      this.radius,
      this.maindx,
      this.maindy,
      this.mainradius,
      this.context,
      this.onTapNavigate,
      this.image);

  final BuildContext context;
  final Function onTapNavigate;
  double maindx;
  double maindy;
  double mainradius;
  ui.Image image;
  double dxLine;
  double dyLine;
  double dxLineTo;
  double dyLineTo;
  double dx;
  double dy;
  double radius;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xff63aa65)
      ..style = PaintingStyle.fill;
    //canvas.drawLine(Offset(50, 0), Offset(100, 0), Paint());
    //canvas.drawLine(Offset(-100, 0), Offset(-50, 0), Paint());
    //canvas.drawLine(Offset(0, 50), Offset(0, 100), Paint());
    //canvas.drawLine(Offset(0, -50), Offset(0, -100), Paint());
    //canvas.drawCircle(Offset(0, 0), 50.0, paint);
    var myCanvas = TouchyCanvas(context, canvas);

    myCanvas.drawCircle(
      Offset(dx, dy),
      radius,
      paint,
      onTapDown: (details) {
        onTapNavigate("erkan");
      },
    );
    myCanvas.drawLine(
        Offset(dxLine, dyLine), Offset(dxLineTo, dyLineTo), Paint());

    myCanvas.drawCircle(Offset(maindx, maindy), mainradius, paint,
        onTapDown: (tapDetail) {
      onTapNavigate("erkan1");
    });
    myCanvas.drawImage(image, new Offset(0, 0), new Paint());
    //canvas.drawCircle(Offset(-125, 0), 25.0, paint);x
    //canvas.drawCircle(Offset(125, 0), 25.0, paint);
    //canvas.drawCircle(Offset(0, -125), 25.0, paint);
    //canvas.drawCircle(Offset(0, 125), 25.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
