import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

testButton() {
  Fluttertoast.showToast(
    msg: "Fungsi button ini belum ada :)",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}

class VerifikasiDuaLangkah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('VERIFIKASI DUA LANGKAH'),
        ),
        body: Container(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Verifikasi dua langkah diaktifkan. Anda perlu memasukan PIN ketika mendaftarkan nomor telepon Anda dengan Four Green lagi.',
                    maxLines: 3,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  height: 1.0,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: InkWell(
                    onTap: () {
                      testButton();
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 20.0,
                          height: 20.0,
                          margin: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.shield),
                        ),
                        Container(
                          child: Text('Nonaktifkan',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: InkWell(
                    onTap: () {
                      testButton();
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 20.0,
                          height: 20.0,
                          margin: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.lock),
                        ),
                        Container(
                          child: Text('Ubah Pin',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      testButton();
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 20.0,
                          height: 20.0,
                          margin: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.email),
                        ),
                        Container(
                          child: Text('Ubah alamat email',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}