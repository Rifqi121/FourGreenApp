import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height*0.025),
      height: size.height*0.37,
      width: size.width*0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: size.height*0.07,
                width: size.width*0.14,
                margin: EdgeInsets.symmetric(vertical: size.height*0.025, horizontal: size.width*0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage('assets/images/yatia.jpg'), fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Nama", style: TextStyle(fontSize: 20),),
                  Text("date"),
                ],
              ),
            ],
          ),
          Column(
              children: <Widget>[
                Container(
                  height: size.height*0.16,
                  margin: EdgeInsets.only(left: size.width*0.05, right: size.width*0.05),
                  child: Text("Hidroponik merupakan..."),
                  ),
              ],
          ),
          Container(
            width: size.width*0.8,
            padding: EdgeInsets.only(top: size.height*0.002),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black))),
            margin: EdgeInsets.only(left: size.width*0.05, right: size.width*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.share_outlined), iconSize: size.height*0.03,color: Colors.black, onPressed: (){Fluttertoast.showToast(
                  msg: "Fungsi button ini belum ada :)",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );},),
                Container(
                  child: Row(children: [
                  IconButton(icon: Icon(CupertinoIcons.chat_bubble_text), iconSize: size.height*0.03,color: Colors.black, onPressed: (){Fluttertoast.showToast(
                    msg: "Fungsi button ini belum ada :)",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                  );},),
                  IconButton(icon: Icon(CupertinoIcons.heart), iconSize: size.height*0.03,color: Colors.black, onPressed: (){Fluttertoast.showToast(
                  msg: "Fungsi button ini belum ada :)",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );},),
                ],)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}