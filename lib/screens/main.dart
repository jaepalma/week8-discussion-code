// import 'package:flutter/material.dart';
// import 'screen_arguments.dart';
// //import 'drawer.dart';
// import 'friendlist.dart';
// import 'slambook.dart';
// import 'friendsprofile.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(brightness: Brightness.dark, appBarTheme: const AppBarTheme(color: Colors.black)),
//       title: "Week 5: Menu, Routes, and Navigation",
//       home: FriendListPage(
//         friends: [],
//       ),
//       onGenerateRoute: (settings) {
//         if (settings.name == "/friendlist") {
//           final args = settings.arguments as ScreenArguments;
//           return MaterialPageRoute(builder: (context) {
//             return FriendListPage(friends: args.friends);
//           });
//         }

//         if (settings.name == "/friendsprofile") {
//           final args = settings.arguments as ScreenArguments;
//           return MaterialPageRoute(builder: (context) {
//             return FriendProfilePage(friends: args.friends, person: args.person);
//           });
//         }

//         if (settings.name == "/slambook") {
//           final args = settings.arguments as ScreenArguments;
//           return MaterialPageRoute(builder: (context) {
//              return Slambook(friends: args.friends); 
//           });
//         }
//         return null;
//       },
//     );
//   }
// }