import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Account_Setting/components/profile_card.dart';
import 'package:fourgreen/Config/config.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _phoneTextEditingController = TextEditingController();
  final TextEditingController _alamat1TextEditingController = TextEditingController();
  final TextEditingController _alamat2TextEditingController = TextEditingController();
  File file;
  String userImage = "";
  String url = "https://firebasestorage.googleapis.com/v0/b/fourgreenapp.appspot.com/o/white.jpg?alt=media&token=f4363e37-56d3-4785-b8ec-d3e411975b8e";

  
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF04855e),
        title: Text("EDIT PROFILE"),
      ),
      backgroundColor: HexColor("#257a60"),
      body: SingleChildScrollView(
      child:Container(
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: Firestore.instance.collection("users").where("uid" , isEqualTo: FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
            }else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, i) {
                DocumentSnapshot doc = snapshot.data.documents[i];
                String name = doc.data["name"].toString();
                String foto = doc.data["foto"].toString();
                String email = doc.data["email"].toString();
                String phone = doc.data["phone"].toString();
                String alamatPenerima = doc.data["alamatPenerima"].toString();
                String alamatPengirim = doc.data["alamatPengirim"].toString();
              return Container(
                  margin: EdgeInsets.symmetric(vertical: size.height*0.02),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: size.height*0.02),
                        child:CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: size.height*0.07,
                            backgroundImage: NetworkImage("$foto"),
                            child: Container(
                              margin: EdgeInsets.only(left: size.width*0.13, top: size.height*0.09),
                                child: IconButton(icon: Icon(Icons.camera_alt, size: size.width*0.1, color: Colors.black,), 
                                onPressed: () { showDialog(
                                  context: context,
                                  builder: (a) {
                                    return SimpleDialog(
                                      title: Text("Pilih Foto"),
                                      children: [
                                        SimpleDialogOption(
                                          child: Text("Buka Kamera"),
                                          onPressed: ambilGambarKamera,
                                        ),
                                        SimpleDialogOption(
                                          child: Text("Buka Galeri"),
                                          onPressed: ambilGambarGaleri,
                                        ),
                                        SimpleDialogOption(
                                          child: Text("Batal"),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  }
                                ).then((value) {uploadgambar();});
                                }
                                ),
                              
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(
                          Icons.person_rounded
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
                          width: size.width*0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: size.height*0.01),
                              child: Text("Name", style: TextStyle(color: Colors.white, fontSize: 18),)),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("$name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("Ini bukan nama pengguna atau PIN anda. Nama ini akan terlihat di Profile akun FourGreen Anda", style: TextStyle(color: Colors.white,))),
                          ],),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: _nameTextEditingController,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RaisedButton(
                                              child: Text("Edit"),
                                              onPressed: _updatename,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        ),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(
                          Icons.email
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
                          width: size.width*0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: size.height*0.01),
                              child: Text("Email", style: TextStyle(color: Colors.white, fontSize: 18),)),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("$email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                            
                          ],),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: _emailTextEditingController,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RaisedButton(
                                              child: Text("Edit"),
                                              onPressed: _updateemail,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        ),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(
                          Icons.phone
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
                          width: size.width*0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: size.height*0.01),
                              child: Text("No Telepon", style: TextStyle(color: Colors.white, fontSize: 18),)),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("$phone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                            ],),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: _phoneTextEditingController,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RaisedButton(
                                              child: Text("Edit"),
                                              onPressed: _updatephone,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        ),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(
                          Icons.person_pin
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
                          width: size.width*0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: size.height*0.01),
                              child: Text("Alamat Penerima", style: TextStyle(color: Colors.white, fontSize: 18),)),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("$alamatPenerima", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("Alamat anda akan dipakai sebagai alamat penerima", style: TextStyle(color: Colors.white,))),
                          ],),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: _alamat1TextEditingController,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RaisedButton(
                                              child: Text("Edit"),
                                              onPressed: _updateAPenerima,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        ),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(
                          Icons.person_pin_circle_rounded
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
                          width: size.width*0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: size.height*0.01),
                              child: Text("Alamat Pengirim", style: TextStyle(color: Colors.white, fontSize: 18),)),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("$alamatPengirim", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                            Container(
                              margin: EdgeInsets.only(bottom: size.height*0.01),
                              child: Text("Alamat anda akan dipakai sebagai alamat Toko", style: TextStyle(color: Colors.white,))),
                          ],),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                      right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: _alamat2TextEditingController,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RaisedButton(
                                              child: Text("Edit"),
                                              onPressed: _updateAPengirim,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        ),
                      ],),
                    ],
                  ),    
                );
              });
            }
          }
        ),
       )
      )
    );
  }

  Firestore firestore = Firestore.instance;
  void _updatename() async {
  try {
    firestore.collection('users').document(FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).updateData({
      'name': _nameTextEditingController.text,
    }).then((value) {Navigator.pop(context);});
    } catch (e) {
      print(e);
    }
  }

  void _updateemail() async {
  try {
    firestore.collection('users').document(FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).updateData({
      'email': _emailTextEditingController.text.trim(),
    }).then((value) {Navigator.pop(context);});
    } catch (e) {
      print(e);
    }
  }

  void _updatephone() async {
  try {
    firestore.collection('users').document(FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).updateData({
      'phone': _phoneTextEditingController.text,
    }).then((value) {Navigator.pop(context);});
    } catch (e) {
      print(e);
    }
  }

  void _updateAPenerima() async {
  try {
    firestore.collection('users').document(FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).updateData({
      'alamatPenerima': _alamat1TextEditingController.text,
    }).then((value) {Navigator.pop(context);});
    } catch (e) {
      print(e);
    }
  }

  void _updateAPengirim() async {
  try {
    firestore.collection('users').document(FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).updateData({
      'alamatPengirim': _alamat2TextEditingController.text,
    }).then((value) {Navigator.pop(context);});
    } catch (e) {
      print(e);
    }
  }


  ambilGambarKamera() async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 600.0, maxWidth: 970.0);

    setState(() {
      file = imageFile;
    });
  }

  ambilGambarGaleri() async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery,);

    setState(() {
      file = imageFile;
    });
  }

  void uploadgambar() async{
        String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
        StorageReference storageReference = FirebaseStorage.instance.ref().child(imageFileName);
        StorageUploadTask storageUploadTask = storageReference.putFile(file);
        StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
        await taskSnapshot.ref.getDownloadURL().then((urlImage) {
          userImage = urlImage;
          _updateFoto();
        });
      }

  void _updateFoto() async {
  try {
    firestore.collection('users').document(FourgreenApp.sharedPreferences.getString(FourgreenApp.userUID)).updateData({
      'foto': userImage,
    });
    } catch (e) {
      print(e);
    }
  }
}



// class AccountSetting extends StatelessWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final List<DocumentSnapshot> listdata;
//   AccountSetting({Key key, this.listdata}) : super(key: key);
//   final TextEditingController _nameTextEditingController = TextEditingController();
//   final TextEditingController _emailTextEditingController = TextEditingController();
//   final TextEditingController _passwordTextEditingController = TextEditingController();
//   final TextEditingController _phoneTextEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: 1,
//       itemBuilder: (context, i) {
//               String name = listdata[i].data["name"].toString();
//               String img = listdata[i].data["img"].toString();
//               String email = listdata[i].data["email"].toString();
//               String phone = listdata[i].data["phone"].toString();
//       return Container(
//           margin: EdgeInsets.symmetric(vertical: size.height*0.02),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(bottom: size.height*0.02),
//                 child: 
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: size.height*0.05,
//                 )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 Icon(
//                   Icons.person_rounded
//                 ),
//                 Container(
//                   decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
//                   width: size.width*0.7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: size.height*0.01),
//                       child: Text("Name", style: TextStyle(color: Colors.white, fontSize: 18),)),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("$name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("Ini bukan nama pengguna atau PIN anda. Nama ini akan terlihat di Profile akun FourGreen Anda", style: TextStyle(color: Colors.white,))),
//                   ],),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.edit),
//                   onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Positioned(
//                               right: -40.0,
//                               top: -40.0,
//                               child: InkResponse(
//                                 onTap: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: CircleAvatar(
//                                   child: Icon(Icons.close),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               ),
//                             ),
//                             Form(
//                               key: _formKey,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: TextFormField(
//                                       controller: _nameTextEditingController,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: RaisedButton(
//                                       child: Text("Edit"),
//                                       onPressed: _update,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     });
//                   },
//                 ),
//               ],),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 Icon(
//                   Icons.email
//                 ),
//                 Container(
//                   decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
//                   width: size.width*0.7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: size.height*0.01),
//                       child: Text("Email", style: TextStyle(color: Colors.white, fontSize: 18),)),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("$email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                    
//                   ],),
//                 ),
//                 Icon(
//                   Icons.edit
//                 ),
//               ],),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 Icon(
//                   Icons.phone
//                 ),
//                 Container(
//                   decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
//                   width: size.width*0.7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: size.height*0.01),
//                       child: Text("No Telepon", style: TextStyle(color: Colors.white, fontSize: 18),)),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("$phone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
//                     ],),
//                 ),
//                 Icon(
//                   Icons.edit
//                 ),
//               ],),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 Icon(
//                   Icons.person_pin
//                 ),
//                 Container(
//                   decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
//                   width: size.width*0.7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: size.height*0.01),
//                       child: Text("Alamat Penerima", style: TextStyle(color: Colors.white, fontSize: 18),)),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("Alamat Penerima", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("Alamat anda akan dipakai sebagai alamat penerima", style: TextStyle(color: Colors.white,))),
//                   ],),
//                 ),
//                 Icon(
//                   Icons.edit
//                 ),
//               ],),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 Icon(
//                   Icons.person_pin_circle_rounded
//                 ),
//                 Container(
//                   decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30))),
//                   width: size.width*0.7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: size.height*0.01),
//                       child: Text("Alamat Pengirim", style: TextStyle(color: Colors.white, fontSize: 18),)),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("Alamat Pengirim", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
//                     Container(
//                       margin: EdgeInsets.only(bottom: size.height*0.01),
//                       child: Text("Alamat anda akan dipakai sebagai alamat Toko", style: TextStyle(color: Colors.white,))),
//                   ],),
//                 ),
//                 Icon(
//                   Icons.edit
//                 ),
//               ],),
//             ],
//           ),    
//       );
//     });
//   }


// }