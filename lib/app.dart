import 'package:flutter/material.dart';
import 'package:jupi/pages/compatibility.dart';
import 'package:jupi/pages/homepage.dart';
import 'package:jupi/pages/profile.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Homepage(),
    Compatibility(),
    Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
      ),
    );
  }
}
