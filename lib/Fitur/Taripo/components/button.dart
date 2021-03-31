import 'package:flutter/material.dart';

class Btntes extends StatelessWidget {
  final String txtBtn;
  final IconData icon;
  final Color color, textColor;

  const Btntes({
    Key key,
    this.txtBtn = "Tips & Trik",
    this.icon = Icons.double_arrow_sharp,
    this.textColor = Colors.white,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF11b18b),
      ),
      child: Center(
        child: FlatButton(
          onPressed: null,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: new Text(
                  txtBtn,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                child: Icon(icon),
              )
              // new Text(txtBtn, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}

class Btntes2 extends StatelessWidget {
  final String txtBtn;
  final IconData icon;

  const Btntes2({
    Key key,
    this.txtBtn = "Tips & Trik",
    this.icon = Icons.double_arrow_sharp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF11b18b),
      ),
      child: Center(
        child: FlatButton(
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: new Text(
                  txtBtn,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                child: Icon(icon),
              )
              // new Text(txtBtn, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
