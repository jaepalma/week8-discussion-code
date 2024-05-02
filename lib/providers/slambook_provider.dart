/*
  Created by: Claizel Coubeili Cepe
  Date: updated April 26, 2023
  Description: Sample todo app with Firebase 
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week7_networking_discussion/api/firebase_todo_api.dart';
import '../models/friend.dart';

class SlambookProvider with ChangeNotifier {
  FirebaseTodoAPI firebaseService = FirebaseTodoAPI();
  late Stream<QuerySnapshot> _friendsStream;
  late Stream<QuerySnapshot> _friendsStream1;
  late Stream<QuerySnapshot> _friendsStream2;

  SlambookProvider() {
    fetchFriends();
  }
  // getter
  Stream<QuerySnapshot> get friend => _friendsStream;
  Stream<QuerySnapshot> get friend1 => _friendsStream1;
  Stream<QuerySnapshot> get friend2 => _friendsStream2;


  void fetchFriends() {
    _friendsStream = firebaseService.getAllFriends();
    _friendsStream1 = firebaseService.getAllFriends();
    _friendsStream2 = firebaseService.getAllFriends();
    notifyListeners();
  }

  void addFriend(Friend friend) async {
    String message = await firebaseService.addFriend(friend.toJson(friend));
    print(message);
    notifyListeners();
  }

  void editFriend(String id, Map<String, dynamic> formValues) async {
    await firebaseService.editFriend(id, formValues);
    notifyListeners();
  }

  void deleteFriend(String id) async {
    await firebaseService.deleteFriend(id);
    notifyListeners();
  }
}