import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Compatibility extends StatefulWidget {
  @override
  _CompatibilityState createState() => _CompatibilityState();
}

class _CompatibilityState extends State<Compatibility> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Compatibility")
    );
  }
}