import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jupi/constant/constant.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/repository/local_repository.dart';
import 'package:jupi/util/util.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _dobTimeTextController = TextEditingController();
  TextEditingController _dobTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _horoscopeTextController = TextEditingController();

  bool isEnabled = false;
  LocalRepository localRepository = LocalRepository();
  late DateTime dob;
  late DateTime time;

  final snackBar = SnackBar(
      duration: Duration(seconds: 2), content: Text('Successfully updated!'));

  @override
  void initState() {
    super.initState();
    _dobTimeTextController.addListener(_checkButtonEnable);
    _dobTextController.addListener(_checkButtonEnable);
    _nameTextController.addListener(_checkButtonEnable);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      User user = context.read<User>();
      _nameTextController.value = TextEditingValue(text: user.name);
      _horoscopeTextController.value =
          TextEditingValue(text: user.horoscope.name());
      dob = user.dob;
      time = user.dob;
      _dobTextController.value = TextEditingValue(
          text: user.dob.day.toString() +
              " " +
              Constant.months[user.dob.month].toString() +
              " " +
              user.dob.year.toString());
      _dobTimeTextController.value = TextEditingValue(
          text: user.dob.hour.toString() + ":" + user.dob.minute.toString());
    });
  }

  onSave() {
    DateTime newDob =
        DateTime(dob.year, dob.month, dob.day, time.hour, time.minute);
    User user = User(_nameTextController.value.text, newDob,
        horoscopeEnumFromString(_horoscopeTextController.value.text));
    Provider.of<User>(context, listen: false).update(user);
    localRepository.addUserData(user);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextFormField(
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Name',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0)),
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'AvenirLight'),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
                ),
                controller: _nameTextController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextFormField(
                enabled: true,
                maxLines: 1,
                readOnly: true,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Date Of Birth',
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'AvenirLight'),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
                ),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 1, 1),
                      maxTime: DateTime.now(), onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    _horoscopeTextController.value =
                        TextEditingValue(text: Util.getHoroscope(date).name());
                    _dobTextController.value = TextEditingValue(
                        text: date.day.toString() +
                            " " +
                            Constant.months[date.month].toString() +
                            " " +
                            date.year.toString());
                    setState(() {
                      dob = date;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                controller: _dobTextController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextFormField(
                enabled: true,
                maxLines: 1,
                readOnly: true,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Date of time',
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'AvenirLight'),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
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
                    print('confirm $date');
                    setState(() {
                      time = date;
                    });
                  }, currentTime: DateTime.now());
                },
                controller: _dobTimeTextController,
              ),
            ),
            TextFormField(
              readOnly: true,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: 'Horoscope',
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'AvenirLight'),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
              ),
              controller: _horoscopeTextController,
            ),
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.only(left: 15, right: 15),
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: !isEnabled ? null : onSave, child: Text("Save")),
            )
          ],
        ),
      ),
    );
  }

  _checkButtonEnable() {
    if (_dobTimeTextController.text == '' ||
        _dobTextController.text == '' ||
        _nameTextController.text == '') {
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
