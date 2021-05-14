import 'package:flutter/material.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/model/user_param.dart';
import 'package:jupi/pages/start/dob_page.dart';
import 'package:provider/provider.dart';

class NamePage extends StatefulWidget {
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController _nameTextController = TextEditingController();
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameTextController.addListener(_checkButtonEnable);
  }

  onPressedNext() {
    UserParam userParam = UserParam();
    userParam.name = _nameTextController.text;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DobPage(userParam);
    }));
    //Navigator.pushNamed(context, "/dobPage", arguments: userParam);
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
                  "Enter Your name",
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
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                        decoration: InputDecoration(
                          hintText: "name",
                        ),
                        controller: _nameTextController,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        margin: EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                            onPressed: !isEnabled
                                ? null
                                : onPressedNext,
                            child: Text("Next")),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _checkButtonEnable() {
    if (_nameTextController == null ||
        _nameTextController.text == '' ||
        _nameTextController.text == null) {
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
