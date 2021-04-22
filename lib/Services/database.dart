import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUsername(String name) {
   return Firestore.instance.collection("users").where("name", isEqualTo: name).getDocuments();

  }
}