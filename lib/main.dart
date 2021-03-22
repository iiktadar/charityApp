import 'package:first_app/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Login_screen.dart';
import 'package:first_app/WelcomePage.dart';
import 'package:first_app/SignUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'Charity App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Charity app development'),
      home: WelcomePage(),
    );
  }
}
