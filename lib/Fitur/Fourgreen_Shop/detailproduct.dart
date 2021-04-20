import 'package:carousel_pro/carousel_pro.dart';
import 'package:fourgreen/Fitur/Fourgreen_Shop/components/group_button.dart';
import 'package:fourgreen/Fitur/Fourgreen_Shop/components/rounded_search_field.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/Fourgreen_Shop/components/pagination.dart';
import 'package:fourgreen/Fitur/Fourgreen_Shop/components/detail.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;

class DetailProduct extends StatefulWidget {
  @override
  _DetailProductState createState() => _DetailProductState();
}

Icon iconc = new Icon(Icons.chat_bubble_outline_rounded);
Icon icont = new Icon(Icons.shopping_cart_outlined);
Icon icons = new Icon(Icons.star);

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;

    return Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            RoundedSearchField(),
            IconButton(icon: iconc, onPressed: null),
            IconButton(icon: icont, onPressed: null),
          ],
        ),
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor('#04855e'),
              ),
              Container(
                padding: EdgeInsets.only(top: logicalSize.height*0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 200.0,
                                width: double.infinity,
                                child: Carousel(
                                  dotColor: Colors.transparent,
                                  dotBgColor: Colors.transparent,
                                  dotSize: 0,
                                  images: [
                                    NetworkImage(
                                        "https://sumeks.co/assets/foto/2019/10/1-hidroponik-57.01-PM.jpg"),
                                    NetworkImage(
                                        "https://akcdn.detik.net.id/api/wm/2020/08/14/ilustrasi-tanaman-hidroponik_169.jpeg"),
                                    NetworkImage(
                                        "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2017/11/Featured_Cara-Menanam-Hidroponik-Pengertiannya-Rapi-dan-Mudah.jpg"),
                                  ],
                                ),
                              ),
                              Pagination(
                                page: "1/3",
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rp25.000",
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                IconButton(
                                  icon: Icon(Icons.favorite, color: Colors.red),
                                  onPressed: null,
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 10.0),
                            child: Text("Tanaman Hidroponik"),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                SmoothStarRating(
                                    allowHalfRating: true,
                                    starCount: 5,
                                    size: 30.0,
                                    color: Colors.grey,
                                    borderColor: Colors.grey,
                                    spacing: 0.0)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 5.0,
                        color: HexColor('#04855e'),
                        margin: EdgeInsets.only(top: 10)),
                    Keterangan(),
                    ButtonGroup(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
