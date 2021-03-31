import 'package:flutter/material.dart';
import 'package:fourgreen/Login/login_screen.dart';
import 'package:fourgreen/Register/components/background.dart';
import 'package:fourgreen/Register/register_screen.dart';
import 'package:fourgreen/components/rounded_button.dart';
import 'package:fourgreen/components/rounded_input_field.dart';
import 'package:fourgreen/components/rounded_password_field.dart';
import 'package:fourgreen/components/rounded_register_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 0), 
            child: 
            Text("REGISTATION'S",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 0), 
            child: 
            Text("YOUR ACCOUNT",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            RegisRoundedButton(
              text: "LOGIN",
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return LoginScreen();},),);},
            ),
            LoginRoundedButton(
              text: "REGISTER",
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return RegisterScreen();},),);},
            )
            ],
            ),
            Align(alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.only(left:40, top: 20),
            child: Text("Nama", 
            style: TextStyle(color: Colors.white)),),),
            
            RRoundedInputField(
              hintText: "Name",
              onChanged: (value) {},
            ),
            Align(alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.only(left:40),
            child: Text("E-mail", 
            style: TextStyle(color: Colors.white)),),),
            RRoundedInputField(
              hintText: "E-mail",
              onChanged: (value) {},
            ),
            Align(alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.only(left:40),
            child: Text("Password", 
            style: TextStyle(color: Colors.white)),),),
            RRoundedPasswordField(
              onChanged: (value) {},
            ),
            Align(alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.only(left:40),
            child: Text("Telepon", 
            style: TextStyle(color: Colors.white)),),),
            RoundedNumInputField(
              hintText: "Telepon",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.02),
            Text("By creating an account, you agree to our", 
            style: TextStyle(color: Colors.white),),
            SizedBox(height: size.height * 0.01),
            Text("Term Of Service and Privacy Policy", 
            style: TextStyle(color: Colors.redAccent),),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "Login",
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return LoginScreen();},),);},
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Forgot Password?", 
                  style: TextStyle(color: Colors.white, fontSize: 16),),
                Text(" CLICK HERE", 
                  style: TextStyle(color: Colors.indigo, fontSize: 12, decoration: TextDecoration.underline)),
              ]
            ),
            SizedBox(height: size.height * 0.09),
          ],
        ),
      ),
    );
    
  }
}