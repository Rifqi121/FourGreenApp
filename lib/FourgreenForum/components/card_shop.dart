import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.25,
      width: size.width*0.35,
      margin: EdgeInsets.only(left: size.width*0.02, right: size.width*0.015, top: size.height*0.02),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(image: AssetImage('assets/images/Nutrisi.jpg'), fit: BoxFit.cover)),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.symmetric(horizontal: size.width*0.01, vertical: size.height*0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nutrisi Tanaman", style: TextStyle(color: Colors.white, fontSize: 16)),
            Row(
              children: [
                Text("4.0", style: TextStyle(color: Colors.white)),
                Icon(Icons.star_rate, color: Colors.white, size: size.height*0.02,)
              ],
            ),
          ],
        ),
      )
    );
  }
}