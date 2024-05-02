/*
  Created by: Claizel Coubeili Cepe
  Date: updated April 26, 2023
  Description: Sample todo app with Firebase 
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week7_networking_discussion/screens/editpage.dart';
import 'package:week7_networking_discussion/screens/friendlist.dart';
import 'package:week7_networking_discussion/screens/friendsprofile.dart';
import 'package:week7_networking_discussion/screens/slambook.dart';
import 'providers/slambook_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SlambookProvider())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, appBarTheme: const AppBarTheme(color: Colors.black)),
      title: "Week 5: Menu, Routes, and Navigation",
      initialRoute: '/friendlist',
      routes: {
        '/friendlist': (context) => const FriendListPage(),
        '/slambook': (context) => const Slambook(),
        '/friendsprofile': (context) => const FriendProfilePage(),
        '/editpage': (context) => const EditPage(),
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/todo_provider.dart';
// import 'screens/todo_page.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// void main() async {
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
// );
// runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: ((context) => TodoListProvider())),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SimpleTodo',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const TodoPage(),
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }
