import 'package:flutter/material.dart';
import 'package:jupi/model/user_param.dart';
import 'package:jupi/pages/home_page.dart';
import 'package:jupi/pages/start/dob_page.dart';
import 'package:jupi/pages/start/dob_time_page.dart';
import 'package:jupi/pages/start/name_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if(settings.name == '/namePage'){
          return MaterialPageRoute(
            builder: (context) {
              return NamePage();
            },
          );
        }
        else if (settings.name == '/dobPage') {
          final UserParam args = settings.arguments as UserParam;
          return MaterialPageRoute(
            builder: (context) {
              return DobPage(args);
            },
          );
        } else if (settings.name == '/dobTimePage') {
          final UserParam args = settings.arguments as UserParam;
          return MaterialPageRoute(
            builder: (context) {
              return DobTimePage(args);
            },
          );
        } else if(settings.name == '/homePage'){
          final UserParam args = settings.arguments as UserParam;
          return MaterialPageRoute(
            builder: (context) {
              return HomePage(args);
            },
          );
        }
        assert(false, 'Implementation ${settings.name}');
        return null;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: NamePage(),
      ),
    );
  }
}
