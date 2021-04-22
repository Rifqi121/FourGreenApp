import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  getUserByUsername(String Name) async{
   return await Firestore.instance.collection("users")
        .where("name", isEqualTo: Name).getDocuments();

  }
}