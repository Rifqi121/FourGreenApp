import 'package:flutter/material.dart';
import 'package:fourgreen/Register/components/body.dart';

class RegisterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Register()
      );
  }
}