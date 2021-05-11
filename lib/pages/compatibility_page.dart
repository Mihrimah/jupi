import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';
import 'package:jupi/model/user.dart';
import 'package:provider/provider.dart';

class CompatibilityPage extends StatefulWidget {
  @override
  _CompatibilityPageState createState() => _CompatibilityPageState();
}

class _CompatibilityPageState extends State<CompatibilityPage> {
  HoroscopeEnum? ownHoroscope;
  HoroscopeEnum otherHoroscope = HoroscopeEnum.Taurus;
  bool ownActive = false;

  setHoroscopeOfActive() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      User user = context.read<User>();
      setState(() {
        ownHoroscope = user.horoscope;
      });
    });
  }

  setHoroscope(val) {
    if (ownActive) {
      setState(() {
        ownHoroscope = val;
      });
    } else {
      setState(() {
        otherHoroscope = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (!ownActive) {
                    setState(() {
                      ownActive = true;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: Center(child: Text(ownHoroscope == null ? "" : ownHoroscope!.name())),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: ownActive ? Colors.red : Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text("vs"),
              ),
              GestureDetector(
                onTap: () {
                  if (ownActive) {
                    setState(() {
                      ownActive = false;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: Center(child: Text(otherHoroscope.name())),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: !ownActive ? Colors.red : Colors.black,
                      style: BorderStyle.solid,
                    ),
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          setHoroscope(HoroscopeEnum.Capricorn);
                        },
                        child: Text(HoroscopeEnum.Capricorn.name()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          setHoroscope(HoroscopeEnum.Libra);
                        },
                        child: Text(HoroscopeEnum.Libra.name()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          setHoroscope(HoroscopeEnum.Capricorn);
                        },
                        child: Text(HoroscopeEnum.Capricorn.name()),
                      ),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          setHoroscope(HoroscopeEnum.Capricorn);
                        },
                        child: Text(HoroscopeEnum.Capricorn.name()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          setHoroscope(HoroscopeEnum.Capricorn);
                        },
                        child: Text(HoroscopeEnum.Capricorn.name()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          setHoroscope(HoroscopeEnum.Capricorn);
                        },
                        child: Text(HoroscopeEnum.Capricorn.name()),
                      ),
                    ),
                  ]),
                ],
              ),
              Container(
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(onPressed: () {}, child: Text("Save")),
              )
            ],
          ))
        ],
      ),
    );
  }
}
