import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';
import 'package:jupi/model/user.dart';
import 'package:provider/provider.dart';

class CompatibilityResultPage extends StatefulWidget {
  HoroscopeEnum ownHoroscope;
  HoroscopeEnum otherHoroscope;

  CompatibilityResultPage(this.ownHoroscope, this.otherHoroscope);

  @override
  _CompatibilityResultPageState createState() =>
      _CompatibilityResultPageState();
}

class _CompatibilityResultPageState extends State<CompatibilityResultPage> {
  int rate = 89; //şimdilik elle verdim.

  @override
  void initState() {
    super.initState();
    change();
  }

  Widget myWidget = Text("vs");
  void change(){
    setState(() {
      myWidget = Text(rate.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Erkan"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                      child:
                          Text(widget.ownHoroscope.name())),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: AnimatedSwitcher(
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        child: child,
                        scale: animation,
                      );
                    },
                    duration: Duration(milliseconds: 5000),
                    child: myWidget,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Center(child: Text(widget.otherHoroscope.name())),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
                child: Column(
              children: [Text("Birşeyler yazacak")],
            ))
          ],
        ),
      ),
    );
  }
}
