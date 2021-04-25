import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/3R/3R.dart';
import 'package:fourgreen/Fitur/Borangan/Borangan.dart';
import 'package:fourgreen/Fitur/Fourgreen_Shop/detailproduct.dart';
import 'package:fourgreen/Fitur/Hamtam/Hamtam.dart';
import 'package:fourgreen/Fitur/Hidroponik/Hidroponik.dart';
import 'package:fourgreen/Fitur/HomeChat/HomeChat.dart';
import 'package:fourgreen/Fitur/List_Produk/listproduk.dart';
import 'package:fourgreen/Fitur/Taripo/Taripo.dart';
import 'package:fourgreen/components/carousel.dart';
import 'package:fourgreen/components/menu_card.dart';
import 'package:fourgreen/components/rounded_search_field.dart';
import 'package:fourgreen/components/shop_card.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget{

   Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
       elevation: 0,
       actions: <Widget>[
         RoundedSearchField(),
         IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: (){
         }),
         IconButton(icon: Icon(Icons.chat_bubble_outline_rounded), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return HomeChat();},),);
         })
       ],
     ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
          children: <Widget>[ 
            Container(
            height: size.height*0.25,
            color: HexColor('#04855e'),
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return Hidroponik();},),);},
                    child: Column(
                      children: <Widget>[
                        MenuCard(
                        icon: Image.asset("assets/icon/logo4green.png"),
                        ),
                        Text("Hidroponik", style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return Hamtam();},),);},
                    child: Column(
                    children: <Widget>[
                    MenuCard(
                    icon: Image.asset("assets/icon/logo4green.png"),
                    ),
                    Text("Hamtam", style: TextStyle(fontSize: 12, color: Colors.white))
                  ],
                  ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return Taripo();},),);},
                    child: Column(
                    children: <Widget>[
                    MenuCard(
                    icon: Image.asset("assets/icon/logo4green.png"),
                    ),
                    Text("Taripo", style: TextStyle(fontSize: 12, color: Colors.white))
                  ],
                  ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return Borangan();},),);},
                    child: Column(
                    children: <Widget>[
                    MenuCard(
                    icon: Image.asset("assets/icon/logo4green.png"),
                    ),
                    Text("Borangan", style: TextStyle(fontSize: 12, color: Colors.white))
                  ],
                  ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return RRR();},),);},
                    child: Column(
                    children: <Widget>[
                    MenuCard(
                    icon: Image.asset("assets/icon/logo4green.png"),
                    ),
                    Text("3R", style: TextStyle(fontSize: 12, color: Colors.white))
                  ],
                  ),
                  ),
                ],
              ),
              ShopCard(),
              SizedBox(height: size.height * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("TOP TRENDING", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Text("Lihat Semua >", style: TextStyle(fontWeight: FontWeight.bold, color: HexColor('#11b18b')),),
                ],
              ),
              ),
              SizedBox(height: size.height * 0.01),
              Carousel(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15),
                  child: GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {return ListProduk();}));},
                  child: new Text("Lihat Semua >", style: TextStyle(fontSize: 12, color: HexColor('#11b18b'))),
                  ),),
                  ]
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShopListCard(),
                  ShopListCard(),
                  ShopListCard(),
                ],
              ),
            ]
          )
        ]
      )
      )
    ); 
  }
}


