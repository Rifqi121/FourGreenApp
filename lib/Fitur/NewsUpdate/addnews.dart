import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/NewsUpdate/newsupdate.dart';
import 'package:image_picker/image_picker.dart';

Icon iconc = new Icon(Icons.chat_bubble_outline_rounded);
Icon icont = new Icon(Icons.shopping_cart_outlined);

class FormTambahOpini extends StatefulWidget {
  @override
  _FormTambahOpiniState createState() => _FormTambahOpiniState();
}

class _FormTambahOpiniState extends State<FormTambahOpini> {
  bool _value = false;
  File file;
  String newsImage = "";

  List<ListItem> _dropdownItems = [
    ListItem(1, "Tips and Trick"),
    ListItem(2, "Opini Farmers"),
    ListItem(3, "Review Hidroponik")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;

  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  final TextEditingController _judulTextEditingController = TextEditingController();
  final TextEditingController _isiberitaTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF04855e),
        title: Text('OPINI FARMERS'),
        actions: [
          IconButton(
            icon: iconc,
            onPressed: () {},
          ),
          IconButton(
            icon: icont,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[350],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xFF04855e),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        'Judul Opini',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: size.height * 0.05,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _judulTextEditingController,
                          decoration: InputDecoration(
                            hintText: 'Masukan Text',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        'Kategori',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: size.height * 0.05,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ListItem>(
                            value: _selectedItem,
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Kategori akan mengelompokan berita anda sesuai tema berita anda',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 2, top: 10.0),
                        child: Text(
                          'Masukan Foto',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: size.height * 0.30,
                        padding: EdgeInsets.symmetric(horizontal: 120),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),

                        image: DecorationImage(
                          image: file==null ? NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQboOnsv2kZeheGGjVDabDarZ7JwdNwoxVi4Q&usqp=CAU") : FileImage(file) ,
                        fit: BoxFit.cover,
                        )

                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 5.0, left: 5.0),
                          height: size.height * 0.05,
                          width: 100,
                          child: Text(
                            'Foto Hanya Dapat Di upload 1',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Card(
                          elevation: 5,
                          child: InkWell(
                            onTap: ()=> ambilGambar(context),
                            child: Container(
                              height: size.height * 0.04,
                              width: 100.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white),
                              child: Text(
                                'CHOOSE FILE',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Isi Pembahasan Berita',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Minimal 500 kata',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        height: size.height * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _isiberitaTextEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Opini kamu akan melalui proses moderasi sebelum di post ke beranda FourGreen Company',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: SwitchListTile(
                        value: _value,
                        onChanged: (bool value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Color(0xff129789),
                        inactiveTrackColor: Colors.grey,
                        title: Text(
                          'By creating an Opini, you agree to our',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'Terms of Service and Privacy Policy',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              height: size.height * 0.07,
              color: Colors.white,
              child: RaisedButton(
                onPressed: uploadImage,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFF04855e),
                  ),
                  child: Text(
                    'SIMPAN OPINI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ambilGambar(mContext){
    return showDialog(
      context: mContext,
      builder: (a) {
        return SimpleDialog(
          title: Text("Item Image"),
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
      );
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



  uploadImage() async{
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference = FirebaseStorage.instance.ref().child(imageFileName);
    StorageUploadTask storageUploadTask = storageReference.putFile(file);
    StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
    await taskSnapshot.ref.getDownloadURL().then((urlImage) {
      newsImage = urlImage;
      tambahberita();
    });
  }
  DocumentSnapshot document;
  void tambahberita() async{
    addNews(document).then((value) {
      Route route = MaterialPageRoute(builder: (c) => NewsUpdate());
      Navigator.pushReplacement(context, route);
    });
  }

  Future addNews(DocumentSnapshot document) async{
    Firestore.instance.collection("berita").document("Test").setData({
      "judul" :_judulTextEditingController.text.trim(),
      "kategori" : _selectedItem,
      "img" : newsImage,
      "isiBerita" :_isiberitaTextEditingController.text.trim(),
    });
}
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

