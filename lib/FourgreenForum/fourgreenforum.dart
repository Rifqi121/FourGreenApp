import 'package:flutter/material.dart';
import 'package:fourgreen/FourgreenForum/components/card_feed.dart';
import 'package:fourgreen/FourgreenForum/components/card_shop.dart';

class ForumScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FOUR GREEN FORUM"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FeedCard(),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                    children: <Widget>[
                        ShopCard(),
                        ShopCard(),
                        ShopCard(),
                        ShopCard(),
                        ShopCard(),
                        ShopCard(),
                      ],
                    )
                  ),
                ),
            FeedCard(),
            FeedCard(),
            Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                  children: <Widget>[
                      ShopCard(),
                      ShopCard(),
                      ShopCard(),
                      ShopCard(),
                      ShopCard(),
                      ShopCard(),
                    ],
                    )
                  ),
                ),
            FeedCard(),
          ],
          ),
      )
      );
  }
}