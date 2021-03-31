import 'package:flutter/material.dart';

class SearchFieldContainer extends StatelessWidget {
  final Widget child;
  const SearchFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
      width: size.width * 0.65,
      height: size.height*0.03,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}