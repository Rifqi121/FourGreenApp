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
  final _formKey = GlobalKey<FormState>();

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
        shrinkWrap: true,
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
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("MESSEGE"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xfff2f4ff)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.2),
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