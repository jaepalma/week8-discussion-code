import 'package:flutter/material.dart';
import '../models/friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week7_networking_discussion/providers/slambook_provider.dart';
import 'package:provider/provider.dart';

class FriendProfilePage extends StatefulWidget {
  static const routename = '/friendsprofile';

  const FriendProfilePage(
      {super.key});

  @override
  State<FriendProfilePage> createState() => _FriendProfilePageState();
}

class _FriendProfilePageState extends State<FriendProfilePage> {
  Map<String, dynamic>? formValues;

  @override
  void dispose() {
    print("Friend Profile Disposed");
    super.dispose();
  }

  Widget? showSummary() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Icon(Icons.person, size: 80),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Text("${Friend.view!.formValues['name']}"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Nickname",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Text("${Friend.view!.formValues['nickname']}"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Age",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Text("${Friend.view!.formValues['age']}"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Relationship Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Text(
                      "${Friend.view!.formValues['isSingle']}"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Happiness Level",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Text("${Friend.view!.formValues['happinessLevel']}"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Super Power",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Text("${Friend.view!.formValues['superpower']}"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Motto in Life",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: Text("${Friend.view!.formValues['faveMotto']}"),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/friendlist', ((Route<dynamic> route) => false));
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Back",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> friendsStream = context.watch<SlambookProvider>().friend2;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: StreamBuilder(
        stream: friendsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error encountered! ${snapshot.error}"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("No Friends Found"),
            );
          }

          // List<QueryDocumentSnapshot<Object?>>? friends = snapshot.data?.docs;

          return SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showSummary() ?? Text("No Summary"),
          ],
        ),
      ));
          
        },
      ),

      
    );
  }
}
