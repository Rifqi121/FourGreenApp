import 'package:flutter/material.dart';

class ClubCard extends StatelessWidget {
  final String judul;
  final String topics;
  final String members;

  const ClubCard({
    Key key,
    this.judul,
    this.topics,
    this.members,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        width: double.infinity,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.grey),
        child: Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    judul,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(topics + '-' + members),
                ),
              ],
            )));
  }
}
