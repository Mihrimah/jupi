import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile")
    );
  }
}