import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fourgreen/Notifikasi_Setting/components/notifiers.dart';
import 'package:fourgreen/Notifikasi_Setting/components/singleRadioButton.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MultiProvider(
   providers: [
    ChangeNotifierProvider<SingleNotifier>(create: (_) => SingleNotifier()),
    ChangeNotifierProvider<SingleNotifierGetar>(create: (_) => SingleNotifierGetar()),
    ChangeNotifierProvider<SingleNotifierPop>(create: (_) => SingleNotifierPop()),
    ChangeNotifierProvider<SingleNotifierTerang>(create: (_) => SingleNotifierTerang()),
   ],
  ));
}

class PengaturanNotifikasi extends StatefulWidget{
  @override
  _PengaturanNotifikasi createState() => _PengaturanNotifikasi();
}

class _PengaturanNotifikasi extends State<PengaturanNotifikasi>{
  bool _value = false;
  bool __value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff04855e),
        title: new Text("PENGATURAN NOTIFIKASI"),
        elevation: 30,
      ),
      body: new Stack(
        children: [
          Container(
            color: Color(0xff257a60),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              children: [
                SwitchListTile(value: _value,
                  onChanged: (value) {
                  setState(() {
                  _value = value;
                });
              },
                activeColor: Colors.white,
                  activeTrackColor: Color(0xff129789),
                  inactiveTrackColor: Colors.grey,
                  title: Text("Nada Percakapan", style: TextStyle(color: Colors.white, fontSize: 18),),
                  subtitle: Text("Putar suara untuk pesan masuk dan"
                      " keluar", style: TextStyle(color: Color(0xff709285), fontSize: 15),),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  height: 3,
                  color: Color(0xff36856d),
                ),
                Container(
                  margin: EdgeInsets.only(right: 270),
                  child: Text("Pesan", style: TextStyle(color: Color(0xff2bc197), fontSize: 18)),
                ),
              ],
            ),
          ),
          ListView(
          children: ListTile.divideTiles(tiles: [
          Padding(padding: EdgeInsets.only(top: 140)),
          ListTile(
          title: Text("Nada Notifikasi", style: TextStyle(color: Colors.white),),
          onTap: () => _showSingleChoiceDialog(context),
          ),
          ListTile(
          title: Text("Getar", style: TextStyle(color: Colors.white),),
          onTap: () => _showSingleChoiceDialogGetar(context),
          ),
          ListTile(
          title: Text("Notifikasi pop-up", style: TextStyle(color: Colors.white),),
          onTap: () => _showSingleChoiceDialogPop(context),
          ),
            ListTile(
          title: Text("Terang", style: TextStyle(color: Colors.white),),
          onTap: () => _showSingleChoiceDialogTerang(context),
          ),
          ], context: context).toList(),
          ),
          Container(
            margin: EdgeInsets.only(top: 380),
            child: Column(
              children: [
                SwitchListTile(value: false, onChanged: (value){
                   setState(() {
                    __value = value;
                 });
              },
                activeColor: Colors.white,
               activeTrackColor: Color(0xff129789),
                inactiveTrackColor: Colors.grey,
                title: Text("Gunakan Notifikasi Prioritas", style: TextStyle(color: Colors.white, fontSize: 18),),
               subtitle: Text("Tampilan pratinjau notifikasi di"
               " bagian atas layar", style: TextStyle(color: Color(0xff709285), fontSize: 15),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

_showSingleChoiceDialog(BuildContext context) => showDialog(context: context, builder: (context){
  final _singleNotifier = Provider.of<SingleNotifier>(context);
  return AlertDialog(
    content: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: nada.map((e) => RadioListTile(
            title: Text(e),
            value: e,
            groupValue: _singleNotifier.currentNada,
            selected: _singleNotifier.currentNada == e,
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

_showSingleChoiceDialogGetar(BuildContext context) => showDialog(context: context, builder: (context){
  final _singleNotifierGetar = Provider.of<SingleNotifierGetar>(context);
  return AlertDialog(
    content: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: getar.map((e) => RadioListTile(
            title: Text(e),
            value: e,
            groupValue: _singleNotifierGetar.currentGetar,
            selected: _singleNotifierGetar.currentGetar == e,
            onChanged: (value) {
              _singleNotifierGetar.updateGetar(value);
              Navigator.of(context).pop();
            },
          )).toList(),
        ),
      ),
    ),
  );
});

_showSingleChoiceDialogPop(BuildContext context) => showDialog(context: context, builder: (context){
  final _singleNotifierPop = Provider.of<SingleNotifierPop>(context);
  return AlertDialog(
    content: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: pop.map((e) => RadioListTile(
            title: Text(e),
            value: e,
            groupValue: _singleNotifierPop.currentPop,
            selected: _singleNotifierPop.currentPop == e,
            onChanged: (value) {
              _singleNotifierPop.updatePop(value);
              Navigator.of(context).pop();
            },
          )).toList(),
        ),
      ),
    ),
  );
});

_showSingleChoiceDialogTerang(BuildContext context) => showDialog(context: context, builder: (context){
  final _singleNotifierTerang = Provider.of<SingleNotifierTerang>(context);
  return AlertDialog(
    content: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: terang.map((e) => RadioListTile(
            title: Text(e),
            value: e,
            groupValue: _singleNotifierTerang.currentTerang,
            selected: _singleNotifierTerang.currentTerang == e,
            onChanged: (value) {
              _singleNotifierTerang.updateTerang(value);
              Navigator.of(context).pop();
            },
          )).toList(),
        ),
      ),
    ),
  );
});

