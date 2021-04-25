import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Config/config.dart';
import 'package:fourgreen/Fitur/HomeChat/conversationScreen.dart';
import 'package:fourgreen/Services/constans.dart';
import 'package:fourgreen/Services/database.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}



class _SearchState extends State<Search> {
  TextEditingController searchTextEditingController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  final formKey = GlobalKey<FormState>();
  QuerySnapshot searchSnapshot;

  Stream chatRoomStream;



  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList(){
    return searchSnapshot != null ? ListView.builder(
        itemCount: searchSnapshot.documents.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return SearchTile(
            name: searchSnapshot.documents[index].data["name"],
            // userEmail: searchSnapshot.documents[index].data["email"],
          );
        }) : Container();
  }

  createChatRoomAndStartConversaion({String name}) {

    print("${Constants.myName}");
    if(name != Constants.myName){
      String chatRoomId = getChatRoomId(name, Constants.myName);

      List<String> users = [name, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users" : users,
        "chatroomId" : chatRoomId
      };

      DatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ConversationScreen(
              chatRoomId
          )
      ));
    } else {
      print("tidak bisa mengirim pesan ke diri sendiri");
    }
  }

  Widget SearchTile({String name}){
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(left: 80)),
              Text(name),
              // Text(userEmail),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChatRoomAndStartConversaion(
                  name: name
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff2bc197),
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Message"),

            ),
          )
        ],
      ),
    );
  }


  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async {
    Constants.myName = FourgreenApp.sharedPreferences.getString(FourgreenApp.userName);
    databaseMethods.getChatRoom(Constants.myName).then((value){
      setState(() {
        chatRoomStream = value;
      });
    });
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SEARCH"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xfff2f4ff)
                        ),
                        padding: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          textInputAction: initiateSearch(),
                          autofocus: true,
                          controller: searchTextEditingController,
                          cursorColor: Colors.greenAccent,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: "Search Username",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.compareTo(b)> 0){
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
