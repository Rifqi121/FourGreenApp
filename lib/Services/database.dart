import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseMethods {

  getUserByUsername(String name) {
   return Firestore.instance.collection("users").where
      ("name", isEqualTo: name).getDocuments();
  }

  getUserByUserEmail(String email) async {
    return await Firestore.instance.collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  uploadUserInfo(userMap){
    Firestore.instance.collection("users").add(userMap).catchError((e){
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomId, chatRoomMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId).setData(chatRoomMap).catchError((e){
          print(e.toString());
    });
  }

  addConversationMessages(String chatRoomId, messegeMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chat")
        .add(messegeMap).catchError((e){
          print(e.toString());
    });
  }

  getConversationMessages(String chatRoomId) async{
    return await Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chat")
    .orderBy("time", descending: false)
        .snapshots();
  }

  getChatRoom(String name) async{
    return await Firestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: name)
        .snapshots();
  }
}