import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final IconData icon;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text = "Test",
    this.press,
    this.icon = Icons.double_arrow_sharp,
    this.color = Colors.green,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 19),
      width: size.width * 0.41,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: FlatButton(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          color: color,
          onPressed: press,
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 15)),
              new Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
                
                Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButton2 extends StatelessWidget {
  final String text;
  final Function press;
  final IconData icon;
  final Color textColor;

  const RoundedButton2({
    Key key,
    this.text,
    this.press,
    this.icon = Icons.double_arrow_sharp,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 19),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: FlatButton(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          color: Color(0xFF11b18b),
          onPressed: press,
          child: Column(
            children: <Widget>[
              // Icon(icon),
              new Text(
                text,
                style: TextStyle(color: Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
