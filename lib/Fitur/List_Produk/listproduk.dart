import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/List_Produk/components/detail_toko.dart';
import 'package:fourgreen/Fitur/List_Produk/components/group_product_card.dart';
import 'package:fourgreen/Fitur/List_Produk/components/rounded_search_field.dart';

class ListProduk extends StatefulWidget {
  @override
  _ListProdukState createState() => _ListProdukState();
}

Icon iconf = new Icon(Icons.filter_list_alt);

class _ListProdukState extends State<ListProduk> {
  List<Widget> containers = [
    Container(
      color: Colors.green[600],
    ),
    Container(
      color: Colors.green[600],
    ),
    Container(
      color: Colors.green[700],
    ),
    Container(
      color: Colors.green[500],
    ),
  ];

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        "Terkait",
        style: TextStyle(color: Colors.black, fontSize: 10.0),
      ),
    ),
    Tab(
      child: Text(
        "Terbaru",
        style: TextStyle(color: Colors.black, fontSize: 10.0),
      ),
    ),
    Tab(
      child: Text(
        "Terlaris",
        style: TextStyle(color: Colors.black, fontSize: 10.0),
        maxLines: 1,
      ),
    ),
    Tab(
      child: Text(
        "Harga<>",
        style: TextStyle(color: Colors.black, fontSize: 10.0),
        maxLines: 1,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            RoundedSearchField(
              hintText: 'Nutrisi Hidroponik',
            ),
            IconButton(icon: iconf, onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                child: TabBar(tabs: myTabs),
              ),
              Container(
                height: 30,
                color: Colors.white,
              ),
              Container(
                  height: 50,
                  color: Colors.grey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blueAccent,
                          ),
                          child: OutlineButton(
                            onPressed: () {},
                            child: Text(
                              'Taripo',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.fromLTRB(0, 5.0, 5.0, 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.greenAccent,
                          ),
                          child: OutlineButton(
                            onPressed: () {},
                            child: Text(
                              'Hama Tanaman',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.fromLTRB(0, 5.0, 5.0, 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.yellowAccent,
                          ),
                          child: OutlineButton(
                            onPressed: () {},
                            child: Text(
                              '3R',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.fromLTRB(0, 5.0, 5.0, 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.pinkAccent,
                          ),
                          child: OutlineButton(
                            onPressed: () {},
                            child: Text(
                              'Hidroponik',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              DetailToko(),
              Container(
                color: Colors.grey[400],
                child: GroupProductCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}