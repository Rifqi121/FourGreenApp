import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Privacy/components/singleRadioButton.dart';
import 'package:provider/provider.dart';
import 'package:fourgreen/Privacy/components/notofiers.dart';

void main() {
  runApp(MultiProvider(
   providers: [
    ChangeNotifierProvider<SingleNotifierPrivacy>(create: (_) =>SingleNotifierPrivacy()),
    ChangeNotifierProvider<SingleNotifierInfo>(create: (_) =>SingleNotifierInfo()),
    ChangeNotifierProvider<SingleNotifierStatus>(create: (_) =>SingleNotifierStatus()),
    ChangeNotifierProvider<SingleNotifierForum>(create: (_) =>SingleNotifierForum()),
    ChangeNotifierProvider<SingleNotifierClub>(create: (_) =>SingleNotifierClub()),
   ],
  ));
}

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy>{

  var _value = false;
  var _valuee = false;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: new AppBar(
      backgroundColor: Color(0xff04855e,),
      title: new Text("PRIVASI DAN KEAMANAN"),
      elevation: 30,
      ),
    body: new Stack(
      children: [
        Container(
          color: Color(0xff257a60),
        ),
        new Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              new Text("Siapa yang dapat melihat info pribadi saya", style: TextStyle(color: Color(0xff2ac89d), fontSize: 17),),
              new Text("Jika anda tidak membagikan info akun Anda,"
                  " Anda juga tidak akan bisa melihat info akun"
                  " orang lain.", style: TextStyle(color: Color(0xff709285), fontSize: 15),),
            ],
          ),
        ),
        //
        ListView(
          children: ListTile.divideTiles(tiles: [
            Padding(padding: EdgeInsets.only(top: 100)),
            ListTile(
              title: Text("Foto Profile", style: TextStyle(color: Colors.white),),
              onTap: () => _showSingleChoiceDialog(context),
            ),
            ListTile(
              title: Text("Info Akun", style: TextStyle(color: Colors.white),),
              onTap: () => _showSingleChoiceDialogInfo(context),
            ),
            ListTile(
              title: Text("Status", style: TextStyle(color: Colors.white),),
              onTap: () => _showSingleChoiceDialogStatus(context),
            ),
            ListTile(
              title: Text("Forum", style: TextStyle(color: Colors.white),),
              onTap: () => _showSingleChoiceDialogForum(context),
            ),
            ListTile(
              title: Text("Club", style: TextStyle(color: Colors.white),),
              onTap: () => _showSingleChoiceDialogClub(context),
            ),
          ], context: context).toList(),
        ),
        // Container(
        //   margin: EdgeInsets.only(top: 390, left: 17),
        //   child: Column(
        //     children: [
        //       new Text("Laporan dibaca", style: TextStyle(color: Colors.white, fontSize: 16), ),
        //     ],
        //   ),
        // ),
        Container(
          margin: EdgeInsets.only(top: 390),
          child: Column(
            children: [
              SwitchListTile(value: _value, onChanged: (value){
                _value = value;
                setState(() {
                  _value = value;
                });
              },
                activeColor: Colors.white,
                activeTrackColor: Color(0xff129789),
                inactiveTrackColor: Colors.grey,
                title: Text("Laporan dibaca", style: TextStyle(color: Colors.white, fontSize: 16),),
                subtitle: Text("Jika dimatikan, Anda tidak akan"
                    " mengirim atau menerima Laporan"
                    " dibaca. Laporan dibaca akan selalu"
                    " dikirim untuk chat forum dan klub", style: TextStyle(color: Color(0xff709285), fontSize: 15),),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 490),
          child: Column(
            children: [
              SwitchListTile(value: _valuee, onChanged: (value){
                _valuee = value;
                setState(() {
                  _valuee = value;
                });
              },
                activeColor: Colors.white,
                activeTrackColor: Color(0xff129789),
                inactiveTrackColor: Colors.grey,
                title: Text("Tampilkan Notifikasi Keamanan", style: TextStyle(color: Colors.white, fontSize: 16),),
                subtitle: Text("Nyalakan setelan ini untuk menerima"
                    " notifikasi ketika kode keamanan salah"
                    " satu pengikut anda berubah."
                    " pelajari selengkapnya"
                    , style: TextStyle(color: Color(0xff709285), fontSize: 15),),
              ),
              // Container(
              //   margin: EdgeInsets.only(right: 180),
              //   child: Column(
              //     children: [
              //       TextButton(onPressed: null,
              //         child: Text(" pelajari selengkapnya", style: TextStyle(color: Color(0xff0cbfa7))),)
              //     ],
              //   ),
              // )
            ],
          ),
        )
      ],
    ),
    );
  }

  _showSingleChoiceDialog(BuildContext context) => showDialog(context: context, builder: (context){
    final _singleNotifier = Provider.of<SingleNotifierPrivacy>(context);
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: foto.map((e) => RadioListTile(
              title: Text(e),
              value: e,
              groupValue: _singleNotifier.currentFoto,
              selected: _singleNotifier.currentFoto == e,
              onChanged: (value) {
                _singleNotifier.updatePilihan(value);
                Navigator.of(context).pop();
              },
            )).toList(),
          ),
        ),
      ),
    );
  });

  _showSingleChoiceDialogInfo(BuildContext context) => showDialog(context: context, builder: (context){
    final _singleNotifierInfo = Provider.of<SingleNotifierInfo>(context);
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: info.map((e) => RadioListTile(
              title: Text(e),
              value: e,
              groupValue: _singleNotifierInfo.currentInfo,
              selected: _singleNotifierInfo.currentInfo == e,
              onChanged: (value) {
                _singleNotifierInfo.updateInfo(value);
                Navigator.of(context).pop();
              },
            )).toList(),
          ),
        ),
      ),
    );
  });

  _showSingleChoiceDialogStatus(BuildContext context) => showDialog(context: context, builder: (context){
    final _singleNotifierStatus = Provider.of<SingleNotifierStatus>(context);
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: info.map((e) => RadioListTile(
              title: Text(e),
              value: e,
              groupValue: _singleNotifierStatus.currentInfo,
              selected: _singleNotifierStatus.currentInfo == e,
              onChanged: (value) {
                _singleNotifierStatus.updateStatus(value);
                Navigator.of(context).pop();
              },
            )).toList(),
          ),
        ),
      ),
    );
  });

  _showSingleChoiceDialogForum(BuildContext context) => showDialog(context: context, builder: (context){
    final _singleNotifierForum = Provider.of<SingleNotifierForum>(context);
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: info.map((e) => RadioListTile(
              title: Text(e),
              value: e,
              groupValue: _singleNotifierForum.currentForum,
              selected: _singleNotifierForum.currentForum == e,
              onChanged: (value) {
                _singleNotifierForum.updateForum(value);
                Navigator.of(context).pop();
              },
            )).toList(),
          ),
        ),
      ),
    );
  });

  _showSingleChoiceDialogClub(BuildContext context) => showDialog(context: context, builder: (context){
    final _singleNotifierClub = Provider.of<SingleNotifierClub>(context);
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: info.map((e) => RadioListTile(
              title: Text(e),
              value: e,
              groupValue: _singleNotifierClub.currentClub,
              selected: _singleNotifierClub.currentClub == e,
              onChanged: (value) {
                _singleNotifierClub.updateClub(value);
                Navigator.of(context).pop();
              },
            )).toList(),
          ),
        ),
      ),
    );
  });
}