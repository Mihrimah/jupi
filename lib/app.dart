import 'package:flutter/material.dart';
import 'package:jupi/model/user.dart';
import 'package:jupi/model/user_param.dart';
import 'package:jupi/pages/compatibility_result_page.dart';
import 'package:jupi/pages/home_page_old.dart';
import 'package:jupi/pages/home_page.dart';
import 'package:jupi/pages/start/dob_page.dart';
import 'package:jupi/pages/start/dob_time_page.dart';
import 'package:jupi/pages/start/name_page.dart';
import 'package:jupi/repository/local_repository.dart';
import 'package:provider/provider.dart';

import 'model/compatibility_request.dart';

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
      } else {
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
      Provider.of<User>(context).update(user);
      return HomePage();
    }
  }

  Widget progressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      themeMode: ThemeMode.dark,
      onGenerateRoute: (settings) {
        if (settings.name == '/compatibilityResultPage') {
          final CompatibilityRequest args =
              settings.arguments as CompatibilityRequest;
          return MaterialPageRoute(
            builder: (context) {
              return CompatibilityResultPage(
                  args.ownHoroscope, args.otherHoroscope);
            },
          );
        }
        assert(false, 'Implementation ${settings.name}');
        return null;
      },
      title: 'Flutter Demo',
      home: Scaffold(
        body: isLoading ? progressIndicator() : decideFirstScreen(),
      ),
    );
  }
}
