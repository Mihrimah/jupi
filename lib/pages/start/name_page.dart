import 'package:flutter/material.dart';
import 'package:jupi/model/user_param.dart';

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
    Navigator.pushNamed(context, "/dobPage",arguments: userParam);
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
              hintText: "Name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
            ),
            controller: _nameTextController,
          ),
          ElevatedButton(
              onPressed: !isEnabled
                  ? null
                  : onPressedNext,
              child: Text("Next"))
        ],
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
