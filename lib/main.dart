import 'package:flutter/material.dart';
import 'package:fourgreen/welcome/splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fourgreen',
      theme: ThemeData( 
        primaryColor: HexColor('#04855e'),
        scaffoldBackgroundColor: HexColor('#04855e'),
        ),
      home: SplashScreen()
    );
  }
}

