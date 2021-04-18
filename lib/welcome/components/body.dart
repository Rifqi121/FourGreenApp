import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Login/login_screen.dart';
import 'package:fourgreen/Register/register_screen.dart';
import 'package:fourgreen/components/rounded_button.dart';
import 'package:fourgreen/welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "MEET UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 44, color: Colors.white),
            ),
            Text(
              "join for us",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset("assets/icon/logo4green.png",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return LoginScreen();},),);},
            ),
            RoundedButton2(
              text: "REGISTER",
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return RegisterScreen();},),);},
            ),
          ],
        ),
      ),
    );
  }
}
