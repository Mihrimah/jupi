import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/model/user_param.dart';
import 'package:jupi/repository/local_repository.dart';
import 'package:jupi/util/util.dart';
import 'package:provider/provider.dart';

import '../home_page2.dart';

class DobTimePage extends StatefulWidget {
  final UserParam userParam;

  DobTimePage(this.userParam);

  @override
  _DobTimePageState createState() => _DobTimePageState();
}

class _DobTimePageState extends State<DobTimePage> {
  TextEditingController _dobTimeTextController = TextEditingController();
  LocalRepository localRepository = LocalRepository();
  bool isEnabled = false;
  DateTime? time;

  @override
  void initState() {
    super.initState();
    time = DateTime(2020, 03, 07, 00, 00);
    _dobTimeTextController.value = TextEditingValue(
        text: time!.hour.toString() + ":" + time!.minute.toString());
    _dobTimeTextController.addListener(_checkButtonEnable);
  }

  onPressedNext() {
    //widget.userParam.dob = dob!;
    DateTime newDob = DateTime(
        widget.userParam.dob.year,
        widget.userParam.dob.month,
        widget.userParam.dob.day,
        time!.hour,
        time!.minute);
    widget.userParam.dob = newDob;
    widget.userParam.horoscope = Util.getHoroscope(newDob);
    localRepository.addUserData(User.of(widget.userParam));

    User user = User.of(widget.userParam);
    Provider.of<User>(context, listen: false).update(user);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePage2();
    }));
    //Navigator.pushNamed(context, "/homePage", arguments: widget.userParam);
  }

  onDateSubmitted(date) {
    setState(() {
      time = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Birth Time",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          enabled: true,
                          maxLines: 1,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                          decoration: InputDecoration(
                            hintText: "Date of time",
                          ),
                          onTap: () {
                            DatePicker.showTimePicker(context,
                                showTitleActions: true,
                                showSecondsColumn: false, onChanged: (date) {
                              print('change $date in time zone ' +
                                  date.timeZoneOffset.inHours.toString());
                            }, onConfirm: (date) {
                              _dobTimeTextController.value = TextEditingValue(
                                  text: date.hour.toString() +
                                      ":" +
                                      date.minute.toString());
                              setState(() {
                                time = date;
                              });
                              print('confirm $date');
                            }, currentTime: DateTime.now());
                          },
                          controller: _dobTimeTextController,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          margin: EdgeInsets.only(top: 50),
                          child: ElevatedButton(
                              onPressed: !isEnabled ? null : onPressedNext,
                              child: Text("Next")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _checkButtonEnable() {
    if (_dobTimeTextController.text == '') {
      setState(() {
        isEnabled = false;
      });
    } else {
      setState(() {
        isEnabled = true;
      });
    }
  }
}
