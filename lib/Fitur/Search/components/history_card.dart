import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.5,
      margin: EdgeInsets.only(right: size.width*0.02),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
        child: Row(
          children: [
            Container(
                height: size.height*0.07,
                width: size.width*0.14,
                margin: EdgeInsets.symmetric(vertical: size.height*0.015, horizontal: size.width*0.015),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage('assets/images/Nutrisi.jpg'), fit: BoxFit.cover,
                  ),
                ),
              ),
            Column(
              children: [
                Text("Vitamin Hidroponik"),
                Text("Rp50.000")
              ],
            )  
          ],
        ),
    );
  }
}
