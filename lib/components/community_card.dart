import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final Widget icon;
  const CommunityCard({
    Key key,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Container(
              padding: EdgeInsets.all(10),
              width: size.width*0.25,
              height: size.height*0.13,
              child: icon,
            ),
          ),
        ),   
    );
  }
}