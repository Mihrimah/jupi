import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jupi/app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enum/horoscope_enum.dart';
import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Provider(
      create: (_) => User("", DateTime.now(), HoroscopeEnum.Taurus),
      child: App()));
}
