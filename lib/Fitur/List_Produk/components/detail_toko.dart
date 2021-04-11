import 'package:flutter/material.dart';

class DetailToko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blueAccent,
                  // image: DecorationImage(
                  //     image: AssetImage('assets/image/foto_profil.png')),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Ananda Farmer',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'AnandaFarmer',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      '90 Produk 5.0 Penilaian',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 50,
                width: 2,
                color: Colors.grey,
              ),
              Container(
                width: 50.0,
                margin: EdgeInsets.all(5.0),
                child: Text(
                  'Toko Lainnya',
                  style: TextStyle(color: Colors.red),
                  maxLines: 2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Text(
                  '>',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}