import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/NewsUpdate/newsupdate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
                          image: file==null ? NetworkImage("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASYAAACsCAMAAADhRvHiAAAASFBMVEX////7+/v5+fn19fXz8/Pu7u7///3//v/q6ur28cH7+fnm5d/x7+qurq77/vze4+jy6u30+Pv29vD7/u3S0dT49937+OT89udH/3/tAAADIElEQVR4nO3d6XbaMBCGYWSD6ZKmTdf7v9MuSQ8hxrZkZqRP0vvkT05oYSzNjLyAORz6Nb0/rz4eMsWhaLj8Ov35QXYTox4jfFh4YFj4u4jhndETxXWpjw9GL5fZ+Cnnq73UXIWNv8KQO6M7Q7qRXVh1Szf2y82eaRnNowCaUUOnS9LcBgFIo9kE7o1K8/hdZ6x1InkhF9A/mlEBwCqj1qW5kM7RqaUVm56N/CVtrI0NDGl45PJphPFz4jDVspgYS70Yf7R76ahiLFuxDfSLfBgsoDCKMNmX0gH0rp6cLbqT6DJMvK/C3LGefDbjvcmdHp3lEPa3gDA7eNQ+N1GoMJ9mo3L+Ov9XOl2jUCTzUxFTciQnm1AW6UzSK9FB3VHqDYheQwKrjaZ5+maeKcnyj1Br3EjHXMNGIJWwJSz8jjXsYmKG8kFHOmyB3PoCADLocH0R4LUT2+Jsmo9Vm0cQqlulGhcumCMDwfuyekEkCPpE5jtqcXcVM+Z373suyrTsoZCj2A+TY5F794/t53eJoO93IM5U/g4L+XuXonb6BZIcYdp/0B8ABcHwvgQ9ubnIO6ecyckkygJ4Y4iuioZP6G47SR6EdD0lyIPTklgQv3jktZaykiHrBUXVV0EvcYAk1aWw4aHA/6caGmy3DW6SpTvTvrqqeSZ5GK2og+rpYBNXcf0hTe/5AmAHdjrEVLrzCnijNJCgaLoUe/HuF3STQ6F7nkSwTTmH1OIpWgen8/rDmcLYZ22KL5FnyP2cDU6wlBUxTAAUqfUmdpXeEDpgEQoFALBm4g6wMaZvpSPwY/Wh+eFvJpFNW57cbkjJTVo8ME5RDI/KGPEsFlt17+N/ncoPhaJ4pfx1jVtfD3P9p82FP89pm93fdWyT9IkbWex0yZ7JKNcWemtIDd6UTPXDvGW1N895nO78dEPpBTVPMUyH9bdLgGtJO1XSzSu/naWoVoumhu0ioW+7Hhe+zRRXKJuCGPzujG7XAXMmk/vFzO9NXC49//jZxHY4e/zlN0o17u8s7KQtDJL5Fra5KrW5VUC6YwP3wPGtZ4frDzQgQ78B6kUDv1U/ysYAAAAASUVORK5CYII=") : FileImage(file) ,
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
    addNews().then((value) {
      Route route = MaterialPageRoute(builder: (c) => NewsUpdate());
      Navigator.pushReplacement(context, route);
    });
  }

  DateFormat formattedDate = DateFormat('dd-MM-yyyy');
  Future addNews() async{
    Firestore.instance.collection("berita").document().setData({
      "judul" :_judulTextEditingController.text.trim(),
      "kategori" : _selectedItem.name,
      "img" : newsImage,
      "isiBerita" :_isiberitaTextEditingController.text.trim(),
      "date": formattedDate.format(DateTime.now()).toString()
    });
}
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

