import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/NewsUpdate/components/tips_and_trik_list_view.dart';

class MyNews extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postingan Saya"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListMyNews(),
            ],
          ),
        ),
      ),
    );
  }
  
}