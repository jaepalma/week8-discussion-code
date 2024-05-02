import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addFriend(Map<String, dynamic> friend) async {
    try {
      await db.collection("friends").add(friend);

      return "Successfully added!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  Stream<QuerySnapshot> getAllFriends() {
    return db.collection("friends").snapshots();
  }

  Future<String> deleteFriend(String id) async {
    try {
      await db.collection("friends").doc(id).delete();

      return "Successfully deleted!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  Future<String> editFriend(String id, String title) async {
    try {
      await db.collection("friends").doc(id).update({"title": title});

      return "Successfully edited!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  // Future<String> toggleStatus(String id, bool value) async {
  //   try {
  //     await db.collection("friends").doc(id).update({"completed": value});

  //     return "Successfully toggled!";
  //   } on FirebaseException catch (e) {
  //     return "Error in ${e.code}: ${e.message}";
  //   }
  // }
}