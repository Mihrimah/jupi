import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jupi/core/custom_picker.dart';
import 'package:jupi/model/user_param.dart';

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
    Navigator.pushNamed(context, "/homePage", arguments: widget.userParam);
  }

  onDateSubmitted(date) {
    print("asdas");
    setState(() {
      dob = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            maxLength: 200,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Date Of Birth",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
            ),
            onTap: () {
              DatePicker.showPicker(context, showTitleActions: true,
                  onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  },
                  pickerModel: CustomPicker(currentTime: DateTime.now()),
                  locale: LocaleType.en);
            },
            controller: _dobTextController,
          ),
          ElevatedButton(
              onPressed: !isEnabled ? null : onPressedNext, child: Text("Next"))
        ],
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
