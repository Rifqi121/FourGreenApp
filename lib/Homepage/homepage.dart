import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Homepage/components/bottom_nav.dart';

class Homepage extends StatefulWidget{
  const Homepage({
    Key key,
    @required this.user
  }) : super (key: key);
  final FirebaseUser user;
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Home(),);
  }
}

