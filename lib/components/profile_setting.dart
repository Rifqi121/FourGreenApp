import 'package:flutter/material.dart';
import 'package:fourgreen/Account_Setting/Account_Setting.dart';

class RoundedText extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedText({
    Key key,
    this.tx = "Toko Saya",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 30.0,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: FlatButton(
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: new Text(
                  tx,
                  style: TextStyle(color: Color(0xFF117b1b)),
                ),
              ),
              Container(
                child: Icon(icon),
              )
              // new Text(txtBtn, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedText2 extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedText2({
    Key key,
    this.tx = "Member Classic",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 30.0,
      margin: EdgeInsets.only(bottom: 5, right: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Center(
        child: FlatButton(
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: new Text(
                  tx,
                  style: TextStyle(color: Color(0xFF117b1b), fontSize: 10),
                ),
              ),
              Container(
                child: Icon(icon),
              )
              // new Text(txtBtn, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getListView(){
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.toc_outlined),
        title: Text("Pesanan Saya"),
        trailing: Icon(Icons.arrow_right),
      )
    ],
  );
  return listView;
}

class RoundedText3 extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedText3({
    Key key,
    this.tx = "Toko Saya",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.0,
      height: 212.0,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(4.0,4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0
            )
          ]
      ),
      child: Container(
        child: FlatButton(
          onPressed: null,
          child: Column(
            children: <Widget>[
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.list_outlined),
                    SizedBox(width: 20,),
                    new Text("Pesanan Saya"),
                    SizedBox(width: 113,),
                    new IconButton(icon: Icon(Icons.arrow_right), onPressed: null)
                  ],
                ),
              ),
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.bookmark_border_rounded),
                    SizedBox(width: 20,),
                    new Text("IOT"),
                    SizedBox(width: 180,),
                    new IconButton(icon: Icon(Icons.arrow_right), onPressed: null)
                  ],
                ),
              ),
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.payment, size: 20,),
                    SizedBox(width: 20,),
                    new Text("Pembayaran"),
                    SizedBox(width: 128,),
                    new IconButton(icon: Icon(Icons.arrow_right), onPressed: null)
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.shopping_bag_outlined, size: 20,),
                    SizedBox(width: 20,),
                    new Text("Riwayat Transaksi"),
                    SizedBox(width: 93,),
                    new IconButton(icon: Icon(Icons.arrow_right), onPressed: null)
                  ],
                ),
              )
          ],
          ),
        ),
      ),
    );
  }
}

class RoundedText4 extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedText4({
    Key key,
    this.tx = "Toko Saya",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.0,
      height: 140.0,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical:10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(4.0,4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0
            )
          ]
      ),
      child: Center(
        child: FlatButton(
          onPressed: null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.people_alt),
                    SizedBox(width: 20,),
                    new Text("Forum"),
                    SizedBox(width: 173,),
                    new Icon(Icons.arrow_right)
                  ],
                ),
              ),
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.star_half),
                    SizedBox(width: 20,),
                    new Text("Review Hidroponik"),
                    SizedBox(width: 97,),
                    new Icon(Icons.arrow_right)
                  ],
                ),
              ),
              GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return AccountSettingScreen();},),);},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Icon(Icons.account_box),
                        SizedBox(width: 20,),
                        new Text("Pengaturan Akun"),
                        SizedBox(width: 100,),
                        new Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
              ),
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(Icons.mark_chat_read_outlined),
                    SizedBox(width: 20,),
                    new Text("Chat dengan Fourgreen Company"),
                    SizedBox(width: 2,),
                    new Icon(Icons.arrow_right)
                  ],
                ),
              )
              // new Text(txtBtn, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTextLogout extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedTextLogout({
    Key key,
    this.tx = "LOGOUT",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 30.0,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF11b18b), width: 2),

        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
          boxShadow: [
            BoxShadow(

                color: Colors.grey[600],
                offset: Offset(4.0,4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0
            )
          ]
      ),
      child: Center(
        child: FlatButton(
          onPressed: (){Navigator.pushReplacementNamed(context, "/logout");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25),
                child: new Text(
                  tx,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedImg extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedImg({
    Key key,
    this.tx = "Member Classic",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 100.0,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            offset: Offset(4.0,4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: null,
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/icon/mahkota.jpeg'))
                  ),
                ),
                new Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only( bottom: 10 , right: 20)
                      ),
                      new Text("REWARD", style: TextStyle(color: Color(0xFF117b1b), fontSize: 9),),
                      new Text("0")
                    ],
                  ),
                )
                // new Text(txtBtn, style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ],

      ),
    );
  }
}

class RoundedImg2 extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedImg2({
    Key key,
    this.tx = "Member Classic",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      height: 100.0,
      margin: EdgeInsets.only(bottom: 20, left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(4.0,4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0
            )
          ]
      ),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: null,
            child: Column(
              children: <Widget>[
                Container(
                  width: 90,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/icon/piagam.jpeg'))
                  ),
                ),
                new Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only( bottom: 10 , right: 20)
                      ),
                      new Text("POINTS", style: TextStyle(color: Color(0xFF117b1b), fontSize: 9),),
                      new Text("0")
                    ],
                  ),
                )
                // new Text(txtBtn, style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ],

      ),
    );
  }
}

class RoundedImg3 extends StatelessWidget {
  final String tx;
  final IconData icon;
  final Color color;

  const RoundedImg3({
    Key key,
    this.tx = "Member Classic",
    this.icon = Icons.arrow_forward_ios_rounded,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 100.0,
      margin: EdgeInsets.only(top: 10, left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(4.0,4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0
            )
          ]
      ),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: null,
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/icon/kupon.jpeg'))
                  ),
                ),
                new Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only( bottom: 10 , right: 20)
                      ),
                      new Text("KUPON SAYA", style: TextStyle(color: Color(0xFF117b1b), fontSize: 8),),
                      new Text("0")
                    ],
                  ),
                )
                // new Text(txtBtn, style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ],

      ),
    );
  }
}

