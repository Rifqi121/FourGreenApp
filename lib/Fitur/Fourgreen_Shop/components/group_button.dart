import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {
  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  final List<bool> isSelected = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToggleButtons(
        children: <Widget>[
          Container(
            width: 70,
            height: 60,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.chat_bubble,
                  color: Colors.green,
                ),
                Text("Chat", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          Container(
            color: Colors.green[700],
            width: 143,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Beli Sekarang", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Container(
            color: Colors.green[700],
            width: 143,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Tambah ke Troli", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                isSelected[buttonIndex] = true;
              } else {
                isSelected[buttonIndex] = true;
              }
            }
          });
        },
        isSelected: isSelected,
      ),
    );
  }
}
