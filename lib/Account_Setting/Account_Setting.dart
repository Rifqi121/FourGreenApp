import 'package:flutter/material.dart';
import 'package:fourgreen/Account_Setting/components/profile_card.dart';
import 'package:fourgreen/Notifikasi_Setting/Notifikasi_Setting.dart';
import 'package:fourgreen/Privacy/privacy.dart';
import 'package:fourgreen/Verifikasi_2Langkah/verifikasidualangkah.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF04855e),
        title: Text("PENGATURAN AKUN"),
      ),
      backgroundColor: HexColor("#257a60"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
          child: Column(children: <Widget>[
            ProfileCard(),
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.mail_outline, color: Colors.white,),
                    new Text("Undang Teman", style: TextStyle(color: Colors.white),),
                    SizedBox(width: size.width*0.1),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white,), onPressed: null)
                  ],
                ),
              ),
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.headset_mic_outlined, color: Colors.white),
                    new Text("Customer Support", style: TextStyle(color: Colors.white)),
                    SizedBox(width: size.width*0.06),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white), onPressed: null)
                  ],
                ),
              ), 
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.star_rate_outlined, color: Colors.white),
                    new Text("Nilai Aplikasi", style: TextStyle(color: Colors.white)),
                    SizedBox(width: size.width*0.12),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white), onPressed: null)
                  ],
                ),
              ),
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.how_to_reg_outlined, color: Colors.white),
                    new Text("Minta Info akun", style: TextStyle(color: Colors.white)),
                    SizedBox(width: size.width*0.08),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white), onPressed: null)
                  ],
                ),
              ),
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.music_note_outlined, color: Colors.white),
                    new Text("Pengturan Notifikasi", style: TextStyle(color: Colors.white)),
                    SizedBox(width: size.width*0.01),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return PengaturanNotifikasi();},),);},)
                  ],
                ),
              ),
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.verified_user_outlined, color: Colors.white),
                    new Text("Privasi dan Keamanan", style: TextStyle(color: Colors.white)),
                    SizedBox(width: size.width*0.001),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return Privacy();},),);},)
                  ],
                ),
              ),
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.library_add_check_outlined, color: Colors.white),
                    new Text("Verifikasi dua langkah", style: TextStyle(color: Colors.white)),
                    SizedBox(width: size.width*0.001),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return VerifikasiDuaLangkah();},),);},)
                  ],
                ),
              ),
            new Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.translate, color: Colors.white),
                    new Text("Bahasa", style: TextStyle(color: Colors.white)),
                    SizedBox(width: size.width*0.22),
                    new IconButton(icon: Icon(Icons.arrow_right, color: Colors.white), onPressed: null)
                  ],
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}