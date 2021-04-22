import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
         Container(
          height: size.height*0.2,
          width: size.width*9,
          child: Row(
            children: <Widget>[
              new Center(
                child: Container(
                  height: size.height*0.15,
                  width: size.width*0.3,
                  margin: EdgeInsets.only(left: 100),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/images/yatia.jpg'), fit: BoxFit.cover,)
                      
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.camera_alt_rounded, size: 35,), onPressed: null),
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  ],
                ),
              ),
            ],
          ),
        ),
      ],

      );
  }
}