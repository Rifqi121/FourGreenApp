import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Config/config.dart';
import 'package:fourgreen/Login/login_screen.dart';
import 'package:fourgreen/Register/components/background.dart';
import 'package:fourgreen/components/errorDialog.dart';
import 'package:fourgreen/components/rounded_button.dart';
import 'package:fourgreen/components/rounded_password_field.dart';
import 'package:fourgreen/components/rounded_register_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final TextEditingController _phoneTextEditingController = TextEditingController();
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
              press: () {Navigator.pushReplacementNamed(context, "/login",);}),
            LoginRoundedButton(
              text: "REGISTER",
              press: () {Navigator.pushReplacementNamed(context, "/register",);}),
            ],
            ),
            Form(
                key: _formKey,
                child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.only(left:40, top: 20),
                    child: Text("Nama", 
                    style: TextStyle(color: Colors.white)),),),
                  RRoundedInputField(
                    controller: _nameTextEditingController,
                    hintText: "Name",
                    onChanged: (input) {},
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Masukan Nama";
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.only(left:40),
                    child: Text("E-mail", 
                    style: TextStyle(color: Colors.white)),),),
                  RRoundedInputField(
                    controller: _emailTextEditingController,
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Masukan E-mail";
                      }
                    },
                    hintText: "E-mail",
                    onChanged: (input) {},
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.only(left:40),
                    child: Text("Password", 
                    style: TextStyle(color: Colors.white)),),),
                  RRoundedPasswordField(
                    controller: _passwordTextEditingController,
                    maxlenght: 8,
                    onChanged: (input) {},
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Masukan Password";
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.only(left:40),
                    child: Text("Telepon", 
                    style: TextStyle(color: Colors.white)),),),
                  RoundedNumInputField(
                    controller: _phoneTextEditingController,
                    hintText: "Telepon",
                    onChanged: (input) {},
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Masukan No Telepon";
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text("By creating an account, you agree to our", 
            style: TextStyle(color: Colors.white),),
            SizedBox(height: size.height * 0.01),
            Text("Term Of Service and Privacy Policy", 
            style: TextStyle(color: Colors.redAccent),),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Register",
              press: _registerUser,
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
    
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerUser() async {
    FirebaseUser firebaseUser;
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      await _auth.createUserWithEmailAndPassword(
        email: _emailTextEditingController.text.trim(), 
        password: _passwordTextEditingController.text.trim()).then((auth) {
          firebaseUser = auth.user;}).catchError((error){
          Navigator.pop(context);
          showDialog(
            context: context,
            builder:  (c)
            {
              return ErrorAlertDialog(message: "Silahkan masukan data dengan benar");
            }
          );
        }
      );

    if(firebaseUser != null){
      saveUserIntoFireStore(firebaseUser).then((value) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => LoginScreen());
        Navigator.pushReplacement(context, route);
      });
    }
  }
  }

  Future saveUserIntoFireStore(FirebaseUser user) async {
  Firestore.instance.collection("users").document(user.uid).setData({
    "uid": user.uid,
    "email": user.email,
    "password": _passwordTextEditingController.text.trim(),
    "name": _nameTextEditingController.text.trim(),
    "phone": _phoneTextEditingController.text.trim()
  });

  await FourgreenApp.sharedPreferences.setString("uid", user.uid);
  await FourgreenApp.sharedPreferences.setString(FourgreenApp.userEmail, user.email);
  await FourgreenApp.sharedPreferences.setString(FourgreenApp.userPass, _passwordTextEditingController.text.trim());
  await FourgreenApp.sharedPreferences.setString(FourgreenApp.userName, _nameTextEditingController.text.trim());
  await FourgreenApp.sharedPreferences.setString(FourgreenApp.userPhone, _phoneTextEditingController.text.trim());

  }

}