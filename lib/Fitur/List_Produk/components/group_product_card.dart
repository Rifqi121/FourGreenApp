import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/List_Produk/components/product_card.dart';

class GroupProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              ProductCard(
                judulp:
                    '(BUY 1 GET 1) Vitamin Hidroponik uk.50ML NEZAFARMER Original Free Ongkir',
                diskon: 'Pilih 5 Diskon Rp3.000',
                harga: 'Rp50.000 - Rp80.000',
                star: 5,
                rating: '720 Terjual',
                lokasi: 'Kab. Bandung',
              ),
              ProductCard(
                judulp:
                    '(BUY 1 GET 10) Vitamin Hidroponik uk.50ML NEZAFARMER Original Free Ongkir',
                diskon: 'Pilih 5 Diskon Rp30.000',
                harga: 'Rp10.000 - Rp20.000',
                star: 4,
                rating: '60 Terjual',
                lokasi: 'Kab. Garut',
              ),
            ],
          ),
          Row(
            children: [
              ProductCard(
                judulp:
                    '(BUY 1 GET 1) Vitamin Hidroponik uk.50ML NEZAFARMER Original Free Ongkir',
                diskon: 'Pilih 5 Diskon Rp3.000',
                harga: 'Rp50.000 - Rp80.000',
                star: 5,
                rating: '720 Terjual',
                lokasi: 'Kab. Bandung',
              ),
              ProductCard(
                judulp:
                    '(BUY 1 GET 10) Vitamin Hidroponik uk.50ML NEZAFARMER Original Free Ongkir',
                diskon: 'Pilih 5 Diskon Rp30.000',
                harga: 'Rp10.000 - Rp20.000',
                star: 4.5,
                rating: '60 Terjual',
                lokasi: 'Kab. Garut',
              ),
            ],
          ),
          Row(
            children: [
              ProductCard(
                judulp:
                    '(BUY 1 GET 1) Vitamin Hidroponik uk.50ML NEZAFARMER Original Free Ongkir',
                diskon: 'Pilih 5 Diskon Rp3.000',
                harga: 'Rp50.000 - Rp80.000',
                star: 5,
                rating: '720 Terjual',
                lokasi: 'Kab. Bandung',
              ),
              ProductCard(
                judulp:
                    '(BUY 1 GET 10) Vitamin Hidroponik uk.50ML NEZAFARMER Original Free Ongkir',
                diskon: 'Pilih 5 Diskon Rp30.000',
                harga: 'Rp10.000 - Rp20.000',
                star: 4,
                rating: '60 Terjual',
                lokasi: 'Kab. Garut',
              ),
            ],
          )
        ],
      ),
    );
  }
}