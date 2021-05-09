import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile")
    );
  }
}