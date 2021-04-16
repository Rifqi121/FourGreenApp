import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Homepage/components/profilescreen.dart';
import 'package:fourgreen/Homepage/homepage.dart';
import 'package:fourgreen/Register/register_screen.dart';
import 'package:fourgreen/components/rounded_button.dart';
import 'package:fourgreen/components/rounded_input_field.dart';
import 'package:fourgreen/components/rounded_password_field.dart';
import 'package:fourgreen/components/toggle_switch.dart';
import 'package:fourgreen/welcome/components/background.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => new _LoginState();
}
class _LoginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            Text("LOGIN TO",
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
              // ToggleTab(),
              LoginRoundedButton(
                text: "LOGIN",
                press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return RegisterScreen();},),);},
              ),
              RegisRoundedButton(
                text: "REGISTER",
                press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return RegisterScreen();},),);},
              )
            ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundedInputField(
                    hintText: "E-mail",
                    onSaved: (input) => _email = input,
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'Masukan E-mail';
                      }
                    },
                  ),
                  RoundedPasswordField(
                    onSaved: (input) => _password = input,
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'Masukan password';
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(margin: EdgeInsets.only(right:10.0),
                      child: Text("Remember me", 
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    Container(margin: EdgeInsets.only(right:50.0),
                    child: ButtonSwitch(),
                    ),
                    ]
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text("Are you don't have an account?", 
                  style: TextStyle(color: Colors.white),),
                  Text("Create a New Account", 
                  style: TextStyle(color: Colors.redAccent),),
                  SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    text: "Login",
                    press: login,
                  ),
                ],
              ),
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
  Future <void> login() async {
  final formState = _formKey.currentState;
  if(formState.validate()){
    formState.save();
    try {
      Future<AuthResult> user = (FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password));
      user.then((userData) => {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(user: userData.user)))});
      
    } catch(e){
      print(e.message);
    }
  }
  }

}

class ButtonSwitch extends StatefulWidget {
  @override
  _ButtonSwitchState createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomSwitch(
              activeColor: Colors.cyan,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),
            SizedBox(height: 0.1,),
            // Text('Value : $status', style: TextStyle(
            //   color: Colors.white,
            //   fontSize: 20.0
            // ),)
          ],
        ),
    );
  }
}