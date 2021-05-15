import 'package:flutter/material.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/pages/compatibility_page.dart';
import 'package:jupi/pages/dash_page.dart';
import 'package:jupi/pages/profile_page.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class HomePageOld extends StatefulWidget {

  @override
  _HomePageOldState createState() => _HomePageOldState();
}

class _HomePageOldState extends State<HomePageOld> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    DashPage(User("", DateTime.now(), HoroscopeEnum.Taurus)),
    CompatibilityPage(),
    ProfilePage(),
    HomePage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("jupi"),toolbarHeight: 56,),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Home"),
          new BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_sharp), label: "Compatability"),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'You'),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Nav')
        ],
      ),
    );
  }
}
