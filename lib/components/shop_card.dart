import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/Fourgreen_Shop/detailproduct.dart';
import 'package:hexcolor/hexcolor.dart';

class ShopCard extends StatelessWidget {
  final Widget icon;
  const ShopCard({
    Key key,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.18,
      margin: EdgeInsets.only(top: size.height*0.025),
      child: Card(
        elevation: 20,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  color: HexColor('#11b18b'),
                  width: size.width*0.85,
                  height: size.height*0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.location_on),
                      Text("Temukan di FOURGREEN Shop", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Text("UBAH", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ],),
                ),
                  Container(
                    margin: EdgeInsets.only(top: size.height*0.01),
                    width: size.width*0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                          children: <Widget>[
                          Image.asset("assets/icon/bibit.png", height: size.height*0.05, width: size.width*0.08,),
                          Text("Bibit", style: TextStyle(fontSize: 12))
                          ],
                        ),
                        ),
                        Container(
                          child: Column(
                          children: <Widget>[
                          Image.asset("assets/icon/nutrisi.png", height: size.height*0.05, width: size.width*0.08,),
                          Text("Nutrisi", style: TextStyle(fontSize: 12))
                          ],
                        ),
                        ),
                        Container(
                          child: Column(
                          children: <Widget>[
                          Image.asset("assets/icon/plant.png", height: size.height*0.05, width: size.width*0.08,),
                          Text("Tanaman", style: TextStyle(fontSize: 12))
                          ],
                        ),
                        ),
                      ],
                  ),  
                ),
              ],
            ),
          ],  
        ) 
      ),
    ); 
  }
}

class ShopListCard extends StatelessWidget {
  final Widget icon;
  const ShopListCard({
    Key key,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.15,
      width: size.width*0.32,
      child: Card(
        color: HexColor("#11b18b"),
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return DetailProduct();},),);},
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10)), color: HexColor('#04855e'),),
                  height: size.height*0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top:10),
                          child: Column(
                          children: <Widget>[
                          Image.asset("assets/icon/plant.png", height: 40, width: 40,),
                          SizedBox(height: size.height*0.01,),
                          Text("50000", style: TextStyle(fontSize: 12))
                          ],
                        ),
                        ),
                    ],),
                ),
                  Container(
                    color: HexColor("#11b18b"),
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                          children: <Widget>[
                          Text("Tanaman", style: TextStyle(fontSize: 12, color: Colors.white))
                          ],
                        ),
                        ),
                      ],
                  ),  
                ),
              ],
            ),
          ],  
        ) 
      ),
      ),
    ); 
  }
}

