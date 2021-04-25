import 'package:flutter/material.dart';

class ListForm extends StatelessWidget {
  final IconData ilabel;
  final String label;
  final String lbutton;
  final IconData ibutton;

  const ListForm({
    Key key,
    this.ilabel,
    this.label,
    this.lbutton,
    this.ibutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.05,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Icon(
                    ilabel,
                    color: Colors.grey[400],
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Text(
                    lbutton,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  Icon(
                    ibutton,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}