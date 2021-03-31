import 'package:fourgreen/components/rounded_search_field.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/Hidroponik/components/rounded_box.dart';
import 'package:fourgreen/Fitur/Hidroponik/components/button.dart';


class Hidroponik extends StatefulWidget {
  @override
  _HidroponikState createState() => _HidroponikState();
}

class _HidroponikState extends State<Hidroponik> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Color(0xFF04855e),
        elevation: 0,
        actions: <Widget>[
          RoundedSearchField(),
          new IconButton(
              icon: new Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null),
          new IconButton(
              icon: new Icon(
                Icons.mark_chat_unread_outlined,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
        body: new Stack(
          children: <Widget>[
            Container(
              height : 70,
              color: Color(0xFF04855e),
            ),
            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            new Column(
              children: <Widget>[
                Container(
                  height: size.height*0.1,
                  width: size.width*0.2,
                  margin: EdgeInsets.symmetric(vertical:10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
                  child: Image.asset(
                          "assets/icon/tree.png",
                ),
                ),
                // Image.asset(
                //   "assets/icon/tree.png",
                //   width: 75.0,
                // ),
                new Text(
                  "Hidroponik",
                  style: new TextStyle(fontSize: 20.0, color: Color(0xFF117b1b)),
                ),
                new Image.asset(
                  "assets/icon/hidroponik.jpg",
                  width: 300.0,
                  height: 300.0,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(
                    //   height: size.height * 0.05,
                    // ),
                    Btntes(
                      txtBtn: "Tips & Trik",
                    ),
                    Btntes2(
                      txtBtn: "Sejarah",
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.00,
                    ),
                    RoundedButton2(
                      text: "Kelebihan&Kekurangan",
                      press: () {},
                    ),
                  ],
                ),
              ],
            ),

          ],
        )
    );
  }
}
