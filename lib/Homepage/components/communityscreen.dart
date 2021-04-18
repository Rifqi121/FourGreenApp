import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fourgreen/ClubFourgreen/clubfourgreen.dart';
import 'package:fourgreen/FourgreenForum/fourgreenforum.dart';
import 'package:fourgreen/components/community_card.dart';
import 'package:fourgreen/components/rounded_search_field.dart';
import 'package:hexcolor/hexcolor.dart';


class CommunityScreen extends StatefulWidget{
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}
  Icon iconc = new Icon(Icons.chat_bubble_outline_rounded);
  Icon icont = new Icon(Icons.shopping_cart_outlined);

class _CommunityScreenState extends State<CommunityScreen> {
  List<Widget> containers = [
    Container(
      color: HexColor('#04855e'),
    ),
    Container(
      color: HexColor('#04855e'),
    ),
    Container(
      color: HexColor('#04855e'),
    ),
  ];

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        "Jawa Barat",
        style: TextStyle(color: Colors.black, fontSize: 10.0),
      ),
    ),
    Tab(
      child: Text(
        "Nasional",
        style: TextStyle(color: Colors.black, fontSize: 10.0),
      ),
    ),
    Tab(
      child: Text(
        "Dunia",
        style: TextStyle(color: Colors.black, fontSize: 10.0),
        maxLines: 1,
      ),
    ),
  ];
  @override
   Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
      appBar: AppBar(
       elevation: 0,
       actions: <Widget>[
         RoundedSearchField(),
         IconButton(icon: icont, onPressed: (){
         }),
         IconButton(icon: iconc, onPressed: (){
         })
       ],
     ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
          children: <Widget>[ 
            Container(
            height: size.height*0.22,
            color: HexColor('#04855e'),
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                    CommunityCard(
                    icon: Image.asset("assets/icon/logo4green.png"),
                    ),
                    Text("HIDROPONIK", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return ClubFourgreenlayout();},),);},
                    child: Column(
                      children: <Widget>[
                      CommunityCard(
                      icon: Image.asset("assets/icon/logo4green.png"),
                      ),
                      Text("KLUB", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return ForumScreen();},),);},
                    child: Column(
                      children: <Widget>[
                      CommunityCard(
                      icon: Image.asset("assets/icon/logo4green.png"),
                      ),
                      Text("FORUM", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                    ),
                  ),
                  ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top:30),
                    height: size.height*0.1,
                    width: size.width*1,
                    child:Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(" TRENDING HIDROPONIK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("Lihat Semua > ", style: TextStyle(color: HexColor("#11b18b")),
                          )
                        ],
                      ),
                      ),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:5),
                    height: size.height*0.1,
                    width: size.width*1,
                    child:Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return ClubFourgreenlayout();},),);},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(" KLUB AKTIF", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("Lihat Semua > ", style: TextStyle(color: HexColor("#11b18b"))
                          )
                        ],
                      ),
                      ),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:5),
                    height: size.height*0.1,
                    width: size.width*1,
                    child:Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return ForumScreen();},),);},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(" FORUM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("Lihat Semua > ", style: TextStyle(color: HexColor("#11b18b"))
                          )
                        ],
                      ),
                      ),
                  ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "TERKINI",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: TabBar(tabs: myTabs),
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: TabBarView(
                      children: containers,
                    ),
                  ),
                ],
              ),
            ],
          ),  
        ),
      ),
    ); 
  }
}




