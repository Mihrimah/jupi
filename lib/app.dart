import 'package:flutter/material.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/model/user_param.dart';
import 'package:jupi/pages/home_page.dart';
import 'package:jupi/pages/start/dob_page.dart';
import 'package:jupi/pages/start/dob_time_page.dart';
import 'package:jupi/pages/start/name_page.dart';
import 'package:jupi/repository/local_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool firstEntry = true;
  bool isLoading = true;
  LocalRepository _localRepository = LocalRepository();
  late User user;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

   getUserData() {
    _localRepository.getUserData().then((value) {
      if (value != null) {
        setState(() {
          isLoading = false;
          firstEntry = false;
          user = value;
        });
      }
      else {
        setState(() {
          isLoading = false;
          firstEntry = true;
        });
      }
    });
  }

  Widget decideFirstScreen() {
    if (firstEntry) {
      return NamePage();
    } else {
      User user = User("Erkan", DateTime.now(), HoroscopeEnum.Capricorn);
      return Provider(create: (_) => user, child: HomePage());
    }
  }

  Widget progressIndicator(){
    return Center(child: CircularProgressIndicator(),);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/namePage') {
          return MaterialPageRoute(
            builder: (context) {
              return NamePage();
            },
          );
        } else if (settings.name == '/dobPage') {
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
        } else if (settings.name == '/homePage') {
          final UserParam args = settings.arguments as UserParam;
          User user = User.of(args);
          return MaterialPageRoute(
            builder: (context) {
              return Provider(
                create: (_) => user,
                child: HomePage(),
              );
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
        body: isLoading ? progressIndicator() : decideFirstScreen(),
      ),
    );
  }
}
