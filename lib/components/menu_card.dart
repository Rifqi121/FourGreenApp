import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Widget icon;
  const MenuCard({
    Key key,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.all(3),
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              padding: EdgeInsets.all(5),
              width: size.width*0.13,
              height: size.height*0.06,
              child: icon,
            ),
          ),
        ),  
      ), 
    );
  }
}