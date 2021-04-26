import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Config/config.dart';
import 'package:fourgreen/Login/login_screen.dart';
import 'package:fourgreen/Register/register_screen.dart';
import 'package:fourgreen/welcome/splash_screen.dart';
import 'package:fourgreen/welcome/welcome_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  FourgreenApp.auth = FirebaseAuth.instance;
  FourgreenApp.sharedPreferences = await SharedPreferences.getInstance();
  FourgreenApp.firestore = Firestore.instance;

  runApp(MyApp(),);
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
      home: SplashScreen(),
      routes: {
        "/register": (_) => new RegisterScreen(),
        "/login": (_) => new LoginScreen(),
        "/logout": (_) => new WelcomeScreen(),
        } ,
    );
  }
}

