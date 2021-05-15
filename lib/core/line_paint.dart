import 'dart:ui';

import 'package:flutter/material.dart';

class LinePaint extends StatefulWidget {

  LinePaint(
      this.mainCirclewidth,
      this.childCirclewidth,
      this.padding,
      this.mainKey,
      this.child1Key,
      this.child2Key,
      this.child3Key,
      this.child4Key,
      this.context,
      this.reanimate);

  bool reanimate;
  double mainCirclewidth;
  double childCirclewidth;
  double padding;

  GlobalKey mainKey;
  GlobalKey child1Key;
  GlobalKey child2Key;
  GlobalKey child3Key;
  GlobalKey child4Key;

  BuildContext context;

  @override
  _LinePaintState createState() => _LinePaintState();
}

class _LinePaintState extends State<LinePaint> with TickerProviderStateMixin {
  late AnimationController _animationController;
  Animation? _animation1;
  Animation? _animation2;
  Animation? _animation3;
  Animation? _animation4;

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void didUpdateWidget(LinePaint oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reanimate != widget.reanimate) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));
      double reducedHeight =
          MediaQueryData.fromWindow(window).padding.top + 56.0;

      RenderBox? box =
          widget.mainKey.currentContext!.findRenderObject() as RenderBox;
      Offset mainPosition = box.localToGlobal(Offset.zero);

      RenderBox? child1 =
          widget.child1Key.currentContext!.findRenderObject() as RenderBox;
      Offset child1Position = child1.localToGlobal(Offset.zero);

      RenderBox? child2 =
          widget.child2Key.currentContext!.findRenderObject() as RenderBox;
      Offset child2Position = child2.localToGlobal(Offset.zero);

      RenderBox? child3 =
          widget.child3Key.currentContext!.findRenderObject() as RenderBox;
      Offset child3Position = child3.localToGlobal(Offset.zero);

      RenderBox? child4 =
          widget.child4Key.currentContext!.findRenderObject() as RenderBox;
      Offset child4Position = child4.localToGlobal(Offset.zero);

      _animation1 = Tween(
              begin: mainPosition.dy - reducedHeight,
              end: child1Position.dy + widget.childCirclewidth - reducedHeight)
          .animate(_animationController)
            ..addListener(() {
              setState(() {});
            });

      _animation2 = Tween(
              begin: mainPosition.dx,
              end: child2Position.dx + widget.childCirclewidth)
          .animate(_animationController)
            ..addListener(() {
              setState(() {});
            });

      _animation3 = Tween(
              begin: mainPosition.dx + widget.mainCirclewidth,
              end: child3Position.dx)
          .animate(_animationController)
            ..addListener(() {
              setState(() {});
            });

      _animation4 = Tween(
              begin: mainPosition.dy + widget.mainCirclewidth - reducedHeight,
              end: child4Position.dy - reducedHeight)
          .animate(_animationController)
            ..addListener(() {
              setState(() {});
            });

      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: GlobalKey(),
      painter: LinePainter(
          widget.mainCirclewidth,
          widget.childCirclewidth,
          widget.padding,
          widget.mainKey,
          widget.child1Key,
          widget.child2Key,
          widget.child3Key,
          widget.child4Key,
          _animation1 == null ? 0 : _animation1!.value,
          _animation2 == null ? 0 : _animation2!.value,
          _animation3 == null ? 0 : _animation3!.value,
          _animation4 == null ? 0 : _animation4!.value,
          context),
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
      this.child1AnimationVal,
      this.child2AnimationVal,
      this.child3AnimationVal,
      this.child4AnimationVal,
      this.context);

  double child1AnimationVal;
  double child2AnimationVal;
  double child3AnimationVal;
  double child4AnimationVal;

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
    //print("Repaint - > " + value.toString());
    //print("Gerçek değer - > " + (child1Position.dy + childCirclewidth - reducedHeight).toString());
    canvas.drawLine(
        Offset(mainPosition.dx + mainCirclewidth / 2,
            mainPosition.dy - reducedHeight),
        Offset(
          child1Position.dx + childCirclewidth / 2,
          //child1Position.dy + childCirclewidth - reducedHeight),
          child1AnimationVal == 0
              ? mainPosition.dy - reducedHeight
              : child1AnimationVal,
        ),
        paint);

    canvas.drawLine(
        Offset(mainPosition.dx,
            mainPosition.dy + mainCirclewidth / 2 - reducedHeight),
        Offset(
            //child2Position.dx + childCirclewidth,
            child2AnimationVal == 0 ? mainPosition.dx : child2AnimationVal,
            child2Position.dy + childCirclewidth / 2 - reducedHeight),
        //child2AnimationVal == 0 ? mainPosition.dy + mainCirclewidth / 2 - reducedHeight : child2AnimationVal,),
        paint);

    canvas.drawLine(
        Offset(mainPosition.dx + mainCirclewidth,
            mainPosition.dy + mainCirclewidth / 2 - reducedHeight),
        Offset(
            //child3Position.dx,
            child3AnimationVal == 0
                ? mainPosition.dx + mainCirclewidth
                : child3AnimationVal,
            child3Position.dy + childCirclewidth / 2 - reducedHeight),
        paint);

    canvas.drawLine(
        Offset(mainPosition.dx + mainCirclewidth / 2,
            mainPosition.dy + mainCirclewidth - reducedHeight),
        Offset(
          child4Position.dx + childCirclewidth / 2,
          //child4Position.dy - reducedHeight),
          child4AnimationVal == 0
              ? mainPosition.dy + mainCirclewidth - reducedHeight
              : child4AnimationVal,
        ),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
