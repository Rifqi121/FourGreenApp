import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fourgreen/Config/config.dart';
import 'package:fourgreen/components/profile_setting.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF04855e),
        elevation: 0,
        centerTitle: false,
        titleSpacing: -10,
        title:
          new Row(
            children: <Widget>[
              RoundedText(tx: "Toko Saya",),
            ],
          ),
        actions: [
          new Container(
                child: IconButton(icon: new Icon(Icons.settings, size: 30,), onPressed: null),
              ),
              new IconButton(icon: new Icon(Icons.shopping_cart, size: 30,), onPressed: null),
              new IconButton(icon: new Icon(Icons.mark_chat_unread_outlined, size: 30,), onPressed: null)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection("users").where("uid" , isEqualTo: FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
              }else {
              return ProfileScreenData(listdata: snapshot.data.documents);
              }
          }
        ),
      ),
    )
    );
  }
}

class ProfileScreenData extends StatelessWidget {
  final List<DocumentSnapshot> listdata;

  const ProfileScreenData({Key key, this.listdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, i) {
              String name = listdata[i].data["name"].toString();
              String foto = listdata[i].data["foto"].toString();
      return Stack(
        children: <Widget>[
          Container(
            height: 160,
            color: Color(0xFF04855e),
          ),
          new Container(
            height: 100,
            width: 70,
            margin: EdgeInsets.only( left:10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage('$foto'), fit: BoxFit.cover,)
            ),
          ),
          new Column(
            children: <Widget>[
            new Container(
              margin: EdgeInsets.only(right: 125,top: 10),
              child: Text(
                "$name", style: TextStyle(fontSize: 15, color: Colors.white),),
              ),
              RoundedText2(),
              new Container(
                margin: EdgeInsets.only(bottom: 20, right: 80),
                child: Text("PENGIKUT 100 | MENGIKUTI 20", style: TextStyle(color: Colors.white, fontSize: 10),),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedImg(),
                  RoundedImg2(),
                  RoundedImg3()
                ],
              ),
              new Column(
                children: <Widget>[
                  RoundedText3(),
                  RoundedText4(),
                  RoundedTextLogout(),
                ],
              )
            ],
          )
        ],
      );
      }
    );
}
}