import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fourgreen/Login/login_screen.dart';
import 'package:fourgreen/Register/register_screen.dart';

class ToggleTab extends StatelessWidget{
  final List<Widget> selected = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(  
      width: 60,  
      borderRadius: 15,  
      initialIndex:0, 
      selectedBackgroundColors: [
        Colors.transparent
      ],
      unSelectedBackgroundColors: [
        Colors.green
      ],
      selectedTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600),
      unSelectedTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400),
      labels: ["LOGIN","REGISTER"],
      selectedLabelIndex: (index) {  
        if( index == 0){
          return LoginScreen();
        }
        else{
          return RegisterScreen();
        }
      },  
    );
  }
}