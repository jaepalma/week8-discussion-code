// import 'package:flutter/material.dart';
// import '../models/friend.dart';

// class FriendProfilePage extends StatefulWidget {
//   static const routename = '/friendsprofile';

//   const FriendProfilePage(
//       {super.key});

//   @override
//   State<FriendProfilePage> createState() => _FriendProfilePageState();
// }

// class _FriendProfilePageState extends State<FriendProfilePage> {
//   Map<String, dynamic>? formValues;

//   @override
//   void dispose() {
//     print("Friend Profile Disposed");
//     super.dispose();
//   }

//   Widget? showSummary() {
//     return Padding(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           Divider(),
//           Padding(
//             padding: EdgeInsets.only(top: 30, bottom: 30),
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: Icon(Icons.person, size: 80),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   "Name",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 Expanded(
//                   child: Text("${widget.person!.formValues['name']}"),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   "Nickname",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 Expanded(
//                   child: Text("${widget.person!.formValues['nickname']}"),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   "Age",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 Expanded(
//                   child: Text("${widget.person!.formValues['age']}"),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   "Relationship Status",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 Expanded(
//                   child: Text(
//                       "${widget.person!.formValues['relationshipStatus']}"),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   "Happiness Level",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 Expanded(
//                   child: Text("${widget.person!.formValues['happinessLevel']}"),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   "Super Power",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 Expanded(
//                   child: Text("${widget.person!.formValues['superPower']}"),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   "Motto in Life",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 )),
//                 Expanded(
//                   child: Text("${widget.person!.formValues['favoriteMotto']}"),
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.all(15),
//               child: Text(
//                 "Back",
//                 style: TextStyle(color: Colors.purple),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Profile"),
//       ),
//       body: SingleChildScrollView(
//           child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             showSummary() ?? Text("No Summary"),
//           ],
//         ),
//       )),
//     );
//   }
// }
