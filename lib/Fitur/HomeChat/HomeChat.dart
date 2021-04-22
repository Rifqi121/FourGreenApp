import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourgreen/Services/database.dart';
class HomeChat extends StatefulWidget{
  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat>{
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapshot;

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
        // shrinkWrap: true,
        itemBuilder: (context, index){
      return SearchTile(
        userName: searchSnapshot.documents[index].data["name"],
        userEmail: searchSnapshot.documents[index].data["email"],
      );
    }) : Container();
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MESSEGE"),
        backgroundColor: Color(0xFF04855e),
      ),
      body: new Stack(
        children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xfff2f4ff)
          ),
          child: GestureDetector(
            onTap: (){
                initState();
            },
            child: Container(
              margin: EdgeInsets.only(left: 70),
              child: TextField(
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
        ),
          searchList()
       ]
      )
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(userName),
              Text(userEmail),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff2bc197),
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Messege"),

            ),
          )
        ],
      ),
    );
  }
}

