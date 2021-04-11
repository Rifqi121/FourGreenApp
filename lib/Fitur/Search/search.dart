import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/Search/components/history_card.dart';
import 'package:fourgreen/Fitur/Search/components/rounded_search_field.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        body: 
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
          child: Column(
            children: [
              RoundedSearchField(),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("RECENTLY VIEWED", style: TextStyle(color: Colors.grey[350])),
                    Text("CLEAR", style: TextStyle(color: Colors.red),)
                  ],
                ),
              ),
              Container(
                color: Colors.grey[100],
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                   children: [
                     HistoryCard(),
                     HistoryCard(),
                     HistoryCard(),
                     HistoryCard(),
                   ],
                  ),
                ),
                ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("REKOMENDASI", style: TextStyle(color: Colors.grey[350])),
                    Text("REFRESH", style: TextStyle(color: Colors.red),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(size.width*0.025),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: size.height*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Vitamin"),
                        Text("Pipa"),
                        Text("Nutrisi"),
                        Text("Bibit Unggul"),
                      ],),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Cangkul Original"),
                        Text("Sekop Original"),
                        Text("Bibit Kangkung")
                      ],),
                    ),
                  ],
                ),
              )
            ],
            ),
        ),
      );
  }
}