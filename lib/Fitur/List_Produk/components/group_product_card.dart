import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/List_Produk/components/product_card.dart';

class GroupProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: ListBarang(
                    ),
                  ),
                ],
              ), 
        ],
      ),
    );
  }
}