import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jupi/constant/constant.dart';
import 'package:jupi/core/custom_picker.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/model/user_param.dart';
import 'package:provider/provider.dart';

import 'dob_time_page.dart';

class DobPage extends StatefulWidget {
  final UserParam userParam;

  DobPage(this.userParam);

  @override
  _DobPageState createState() => _DobPageState();
}

class _DobPageState extends State<DobPage> {
  TextEditingController _dobTextController = TextEditingController();

  bool isEnabled = false;
  DateTime? dob;

  @override
  void initState() {
    super.initState();
    _dobTextController.addListener(_checkButtonEnable);
  }

  onPressedNext() {
    widget.userParam.dob = dob!;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DobTimePage(widget.userParam);
    }));
    //Navigator.pushNamed(context, "/dobTimePage", arguments: widget.userParam);
  }

  onDateSubmitted(date) {
    setState(() {
      dob = date;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Birth Date And Time",
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
                            hintText: "Date of birth",
                          ),
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1900, 1, 1),
                                maxTime: DateTime.now(), onChanged: (date) {
                              print('change $date in time zone ' +
                                  date.timeZoneOffset.inHours.toString());
                            }, onConfirm: (date) {
                              _dobTextController.value = TextEditingValue(
                                  text: date.day.toString() +
                                      " " +
                                      Constant.months[date.month].toString() +
                                      " " +
                                      date.year.toString());
                              setState(() {
                                dob = date;
                              });
                              print('confirm $date');
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          controller: _dobTextController,
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
    if (_dobTextController.text == '') {
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
