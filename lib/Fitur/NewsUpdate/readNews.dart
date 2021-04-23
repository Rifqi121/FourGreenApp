import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/NewsUpdate/addnews.dart';
import 'package:fourgreen/Fitur/NewsUpdate/components/carousel_video.dart';
import 'package:fourgreen/Fitur/NewsUpdate/components/rounded_search_field.dart';
import 'package:fourgreen/Fitur/NewsUpdate/components/tips_and_trik_list_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class ReadNews extends StatefulWidget {
  final String judul;
  final String img;
  final String isiBerita;
  final String date;

  const ReadNews({Key key, this.judul, this.img, this.isiBerita, this.date}) : super(key: key);
  @override
  _ReadNewsState createState() => _ReadNewsState();
}

Icon iconc = new Icon(Icons.search_outlined);


class _ReadNewsState extends State<ReadNews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("FourGreen News"),
        elevation: 0,
          backgroundColor: HexColor('#04855e'),
          actions: <Widget>[
            IconButton(
              icon: iconc,
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Fungsi button ini belum ada :)",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ]
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.01),
              child: Text("${widget.judul}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
            ),
            Container(
              height: size.height*0.25,
              width: size.width*0.8,
              margin: EdgeInsets.symmetric(horizontal: size.width*0.02, vertical: size.height*0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage("${widget.img}"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.01),
              child: Text("${widget.date}", style: TextStyle(fontSize: 10),)
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.01),
              child: Text("${widget.isiBerita}", style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,)
            ),
          ],
        ),
      ),
    );
  }
}
