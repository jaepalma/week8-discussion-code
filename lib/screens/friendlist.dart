import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week7_networking_discussion/providers/slambook_provider.dart';

class FriendListPage extends StatelessWidget {
  const FriendListPage({Key? key}) : super(key: key);

  Widget friendsListTile(BuildContext context, friends) {
    List<Widget> _friendsListTileWidget = [];
    if (friends.isEmpty) {
      return Center(
        child: Column(
          children: [
            Text("No Friend To Show"),
          ],
        ),
      );
    } else {
      friends.forEach((element) {
        _friendsListTileWidget.add(
          Padding(
            padding: EdgeInsets.only(bottom: 30, right: 30, left: 30),
            child: ListTile(
              leading: Icon(
                Icons.people,
                size: 20,
              ),
              title: Text(element.formValues['name']),
              tileColor: Colors.black12,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/friendsprofile",
                );
              },
            ),
          ),
        );
      });
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _friendsListTileWidget,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> friendsStream = context.watch<SlambookProvider>().friend;
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend List"),
      ),
      drawer: AppDrawer(),
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

          List<QueryDocumentSnapshot<Object?>>? friends = snapshot.data?.docs;

          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Text(
                      'FRIEND LIST',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.purple.shade400,
                      ),
                    ),
                  ),
                  friendsListTile(context, friends),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// body: StreamBuilder(
//         stream: friendsStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Error encountered! ${snapshot.error}"),
//             );
//           } else if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (!snapshot.hasData) {
//             return Center(
//               child: Text("No Friends Found"),
//             );
//           }

//           List<QueryDocumentSnapshot<Object?>>? friends = snapshot.data?.docs;

          
//         },
//       ),
