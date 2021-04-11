import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/Search/search.dart';

class SearchFieldContainer extends StatelessWidget {
  final Widget child;
  const SearchFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return SearchPage();},),);},
        child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
        width: size.width * 0.9,
        height: size.height*0.05,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: child,
      ),
    );
  }
}