import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/model/user_param.dart';
import 'package:provider/provider.dart';

class DashPage extends StatefulWidget {

  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CarouselSlider(
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
          )
        ],
      ),
    );
  }
}
