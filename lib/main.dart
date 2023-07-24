import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => Loading(),
              '/home': (context) => Home(),
              '/location': (context) => ChooseLocation(),
            },
            debugShowCheckedModeBanner: false,
          )));
}
