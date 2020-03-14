import 'package:firebase_mlkit/Pages/CustomModelPage.dart';
import 'package:firebase_mlkit/Pages/FirebaseVisionTextPage.dart';
import 'package:firebase_mlkit/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Firebase ML Kit',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      routes: {
        '/firebase_vision' : (context) => FirebaseVisionTextPage(),
        '/firebase_custom' : (context) => CustomModelPage()
      },
    );
  }
}