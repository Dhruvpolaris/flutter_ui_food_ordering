import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
        //https://dribbble.com/shots/9094050-Online-Reservation
        //https://github.com/rajayogan/FlutterUI---Emojis/
      ) 
    );
  }
}

