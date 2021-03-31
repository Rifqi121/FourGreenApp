import 'package:flutter/material.dart';

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text("Keterangan"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text("Merk   : xxxxxxx"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text("Jenis  : xxxxxxx"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text("Lokasi : xxxxxxx"),
          ),
        ],
      ),
    );
  }
}
