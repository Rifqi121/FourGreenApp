import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fourgreen/Fitur/HomeChat/HomeChat.dart';


class NotificationScreen extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<NotificationScreen> {
  List dataJSON;

  Future<String> ambildata() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/photos"),
        headers: {"Accept": "application/JSON"});

    this.setState(() {
      dataJSON = json.decode(hasil.body);
    });
  }

  @override
  void initState() {
    this.ambildata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Notifikasi'),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline_outlined),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeChat();
                  },),);
                })
            ],
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: null,
            )),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 450.0,
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: dataJSON == null ? 0 : dataJSON.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                    margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(dataJSON[i]['url']),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          width: 270.0,
                          height: 40.0,
                          padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Judul",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Text(
                                    "19.00 AM",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 250,
                                    child: Text(
                                      dataJSON[i]['title'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                    size: 10.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 20.0,
                    color: Colors.grey,
                    padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Update Pesanan",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          "Tandai Telah Dibaca(10)",
                          style: TextStyle(fontSize: 12.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 171,
                    color: Colors.orangeAccent[100],
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQytn08LqC3xu_80WqwpWcTvPo2xcLobwnm2A&usqp=CAU'),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Berikan nilai untuk pesanan",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    Icon(Icons.arrow_drop_down_sharp),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 250,
                                    child: Text(
                                      "Pesanan " +
                                          "0129423" +
                                          " telah selesai. Nilai pesanan sebelum 06-08-2021  dapatkan point Four Green. Ulasanmu sangat berarti bagi pengguna FourGreen lainnya!",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 10.0),
                                      maxLines: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 20.0,
                      color: Colors.grey,
                      padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}