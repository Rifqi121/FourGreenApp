import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductCard extends StatelessWidget {
  final String judulp;
  final String diskon;
  final String harga;
  final String rating;
  final double star;
  final String lokasi;

  const ProductCard({
    Key key,
    this.judulp,
    this.diskon,
    this.harga,
    this.rating,
    this.star,
    this.lokasi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 250,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.green,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                judulp,
                style: TextStyle(fontSize: 15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.red)),
              child: Text(diskon,
                  style: TextStyle(fontSize: 10, color: Colors.red)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(harga,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.favorite_border_outlined),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                                allowHalfRating: true,
                                starCount: 5,
                                rating: star,
                                size: 10.0,
                                color: Colors.yellowAccent[400],
                                borderColor: Colors.grey,
                                spacing: 0.0),
                            Text(rating,
                                style: TextStyle(
                                  fontSize: 10,
                                ))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 10,
                            ),
                            Text(lokasi,
                                style: TextStyle(
                                  fontSize: 10,
                                ))
                          ],
                        )
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}