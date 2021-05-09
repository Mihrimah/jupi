import 'package:flutter/material.dart';
import 'package:jupi/model/user_param.dart';
import 'package:jupi/pages/compatibility_page.dart';
import 'package:jupi/pages/dash_page.dart';
import 'package:jupi/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  final UserParam userParam;

  HomePage(this.userParam);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    DashPage(),
    CompatibilityPage(),
    ProfilePage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jupi"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "MyBets"),
          new BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_sharp), label: "Bet"),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile')
        ],
      ),
    );
  }
}
