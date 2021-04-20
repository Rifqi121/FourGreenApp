import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  final String page;
  const Pagination({
    Key key,
    this.page,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      width: 40.0,
      height: 30.0,
      margin: EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          page,
        ),
      ),
    );
  }
}
