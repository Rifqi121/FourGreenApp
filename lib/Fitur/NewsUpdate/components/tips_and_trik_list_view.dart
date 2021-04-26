import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Config/config.dart';
import 'package:fourgreen/Fitur/NewsUpdate/editNews.dart';
import 'package:fourgreen/Fitur/NewsUpdate/readNews.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';

class ListTipsTrik extends StatefulWidget {
  @override
  _ListTipsTrikState createState() => _ListTipsTrikState();
}

class _ListTipsTrikState extends State<ListTipsTrik>{
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: Firestore.instance.collection("berita").where("kategori" , isEqualTo: "Tips and Trick").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
            }else {
            return NewsTipsTrik(listNews: snapshot.data.documents);
            }
        }
      ),
    );
  }
}

class NewsTipsTrik extends StatelessWidget {
  final List<DocumentSnapshot> listNews;

  const NewsTipsTrik({Key key, this.listNews}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ListView.builder(
            itemCount: listNews == null ? 0 : listNews.length,
            itemBuilder: (context, i) {
              String judul = listNews[i].data["judul"].toString();
              String img = listNews[i].data["img"].toString();
              String date = listNews[i].data["date"].toString();
              String isiBerita = listNews[i].data["isiBerita"].toString();
              return InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (c) => ReadNews(judul: judul, img: img, date:date, isiBerita: isiBerita)));},
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage('$img'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 270.0,
                        height: 60.0,
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Tips & Trick",
                              style:
                                  TextStyle(fontSize: 14.0, color: HexColor("#40c1a2")),
                            ),
                            Text(
                              '$judul',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$date | FourGrenn Company",
                              style: TextStyle(fontSize: 10.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}

class ListOpiniFarmers extends StatefulWidget {
  @override
  _ListOpiniFarmersState createState() => _ListOpiniFarmersState();
}

class _ListOpiniFarmersState extends State<ListOpiniFarmers>{
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: Firestore.instance.collection("berita").where("kategori" , isEqualTo: "Opini Farmers").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
            }else {
            return NewsTipsTrik(listNews: snapshot.data.documents);
            }
        }
      ),
    );
  }
}

class NewsOpiniFarmers extends StatelessWidget {
  final List<DocumentSnapshot> listNews;

  const NewsOpiniFarmers({Key key, this.listNews}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ListView.builder(
            itemCount: listNews == null ? 0 : listNews.length,
            itemBuilder: (context, i) {
              String judul = listNews[i].data["judul"].toString();
              String img = listNews[i].data["img"].toString();
              String date = listNews[i].data["date"].toString();
              return Container(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage('$img'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      width: 270.0,
                      height: 60.0,
                      padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Opini Farmer",
                            style:
                                TextStyle(fontSize: 14.0, color: HexColor("#40c1a2")),
                          ),
                          Text(
                            '$judul',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$date | FourGrenn Company",
                            style: TextStyle(fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}

class ListReviewHidroponik extends StatefulWidget {
  @override
  _ListReviewHidroponikState createState() => _ListReviewHidroponikState();
}

class _ListReviewHidroponikState extends State<ListReviewHidroponik>{
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: Firestore.instance.collection("berita").where("kategori" , isEqualTo: "Review Hidroponik").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
            }else {
            return NewsTipsTrik(listNews: snapshot.data.documents);
            }
        }
      ),
    );
  }
}

class NewsReviewHidroponik extends StatelessWidget {
  final List<DocumentSnapshot> listNews;

  const NewsReviewHidroponik({Key key, this.listNews}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ListView.builder(
            itemCount: listNews == null ? 0 : listNews.length,
            itemBuilder: (context, i) {
              String judul = listNews[i].data["judul"].toString();
              String img = listNews[i].data["img"].toString();
              String date = listNews[i].data["date"].toString();
              return Container(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage('$img'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      width: 270.0,
                      height: 60.0,
                      padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Review Hidroponik",
                            style:
                                TextStyle(fontSize: 14.0, color: HexColor("#40c1a2")),
                          ),
                          Text(
                            '$judul',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$date | FourGrenn Company",
                            style: TextStyle(fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}

class ListMyNews extends StatefulWidget {
  @override
  _ListMyNewsState createState() => _ListMyNewsState();
}

class _ListMyNewsState extends State<ListMyNews>{
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: Firestore.instance.collection("berita").where("idPemosting" , isEqualTo: FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
            }else {
            return ListDataMyNews(listNews: snapshot.data.documents);
            }
        }
      ),
    );
  }
}

class ListDataMyNews extends StatelessWidget {
  final List<DocumentSnapshot> listNews;

  const ListDataMyNews({Key key, this.listNews}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
            itemCount: listNews == null ? 0 : listNews.length,
            itemBuilder: (context, i) {
              String judul = listNews[i].data["judul"].toString();
              String img = listNews[i].data["img"].toString();
              String date = listNews[i].data["date"].toString();
              String isiBerita = listNews[i].data["isiBerita"].toString();
              String kategori = listNews[i].data["kategori"].toString();
              return InkWell(
                onLongPress: () {
                  { showDialog(
                      context: context,
                      builder: (a) {
                       return SimpleDialog(
                          title: Text("Pilih Foto"),
                          children: [
                            SimpleDialogOption(
                              child: Text("EDIT"),
                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (c) => FormEditNews(judul: judul, img: img, isiBerita: isiBerita)));},
                              ),
                            SimpleDialogOption(
                              child: Text("DELETE"),
                              onPressed: (){},
                              ),
                            SimpleDialogOption(
                              child: Text("Batal"),
                              onPressed: (){
                              Navigator.pop(context);
                              },
                             )
                            ],
                          );
                        }
                      );
                    }
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage('$img'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 270.0,
                        height: 60.0,
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "$kategori",
                              style:
                                  TextStyle(fontSize: 14.0, color: HexColor("#40c1a2")),
                            ),
                            Text(
                              '$judul',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$date",
                              style: TextStyle(fontSize: 10.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}