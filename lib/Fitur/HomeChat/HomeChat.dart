import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Config/config.dart';
import 'package:fourgreen/Fitur/HomeChat/conversationScreen.dart';
import 'package:fourgreen/Fitur/HomeChat/search.dart';
import 'package:fourgreen/Services/constans.dart';
import 'package:fourgreen/Services/database.dart';
import 'package:fourgreen/Services/helperFunction.dart';
class HomeChat extends StatefulWidget{
  @override
  _HomeChatState createState() => _HomeChatState();
}

  String myName;

class _HomeChatState extends State<HomeChat>{
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatRoomStream;

  Widget chatRoomList() {
    return StreamBuilder(
      stream: chatRoomStream,
      builder: (context, snapshot){
        return snapshot.hasData ?  ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              return ChatRoomTile(
                  snapshot.data.documents[index].data["chatroomId"]
                      .toString().replaceAll("_", "").replaceAll(Constants.myName, ""),
                  snapshot.data.documents[index].data["chatroomId"]
              );
            }): Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async{
    Constants.myName = FourgreenApp.sharedPreferences.getString(FourgreenApp.userName);
    databaseMethods.getChatRoom(myName).then((value){
      setState(() {
        chatRoomStream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("MESSAGE")
      ),
      backgroundColor: Colors.white,
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.search),
       onPressed: (){
         Navigator.push(context, MaterialPageRoute(
             builder: (context) => Search()
         ));
       },
     ),
      body: chatRoomList(),
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  final String name;
  final String chatRoomId;
  ChatRoomTile(this.name, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ConversationScreen(chatRoomId)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Text("${name.substring(0, 1).toUpperCase()}"),
            ),
            SizedBox(width: 8,),
            Text(name, style: TextStyle(fontSize: 17),)
          ],
        ),
      ),
    );
  }
}