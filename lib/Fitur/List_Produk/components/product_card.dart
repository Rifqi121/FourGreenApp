import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ListBarang extends StatefulWidget {
  @override
  _ListBarangState createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection("produk").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
            }else {
            return ProductCard(listProduk: snapshot.data.documents);
            }
        }
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final List<DocumentSnapshot> listProduk;
  const ProductCard({Key key, this.listProduk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation ==
          Orientation.landscape ? 2: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        childAspectRatio: 0.9,
      ),
      itemCount: listProduk == null ? 0 : listProduk.length,
      itemBuilder: (context, i) {
        String nama = listProduk[i].data["Nama"].toString();
        String harga = listProduk[i].data["Harga"].toString();
        String lokasi = listProduk[i].data["lokasi"].toString();
        String diskon = listProduk[i].data["diskon"].toString();
        double star = listProduk[i].data["star"].toDouble();
        String rating = listProduk[i].data["rating"].toString();
        return Container(
          margin: EdgeInsets.symmetric(horizontal: size.width*0.01, vertical: size.height*0.006),
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
                  nama,
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
        
      );
    });
  }
}