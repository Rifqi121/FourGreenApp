import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Search'),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline_outlined),
                onPressed: null,
              )
            ],),
        body: SingleChildScrollView(
          child: Column(children: [
            
          ],),
        )
      );
  }
}