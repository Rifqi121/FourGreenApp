import 'package:flutter/material.dart';
import 'package:fourgreen/Login/components/body.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: Login(),);
  }
}