import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: HexColor("#04855e"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 20,
      child: Container(
        height: size.height*0.2,
        width: size.width*9,
        child: Row(
          children: <Widget>[
            new Container(
            height: size.height*0.15,
            width: size.width*0.3,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/images/yatia.jpg'), fit: BoxFit.cover,)
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Nama", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                Text("email", style: TextStyle(fontSize: 12),),
                Text("noTlp", style: TextStyle(fontSize: 12),),
                Container(
                  width: size.width * 0.35,
                  height: size.height*0.045,
                  margin: EdgeInsets.only(top: size.height*0.01),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "Fungsi button ini belum ada :)",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      },
                      child: Text("EDIT PROFILE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),),
            
          ],
        ),
      ),
    );
  }
}