import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'textfield.dart';
import 'switch.dart';
import 'slide.dart';
import 'radio.dart';
import 'summary.dart';
import 'drawer.dart';
import '../models/friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week7_networking_discussion/providers/slambook_provider.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}



class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> curr;
  bool showText = false;
  String name = "";
  String nickname = "";
  int age = 0;
  bool isSingle = false;
  double happinessLevel = 1.0;
  String superpower = 'Makalipad';
  String faveMotto = '';

  //controllers for when the form resets
  TextEditingController nameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    //dispose controllers when they are no longer needed
    nameController.dispose();
    nicknameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    name = Friend.edit!.formValues['name'];
    nickname = Friend.edit!.formValues['nickname'];
    age = Friend.edit!.formValues['age'];
    isSingle = Friend.edit!.formValues['isSingle'];
    happinessLevel = Friend.edit!.formValues['happinessLevel'];
    superpower = Friend.edit!.formValues['superpower'];
    faveMotto = Friend.edit!.formValues['faveMotto'];
  }

  //add this method to reset all text fields
  void resetForm() {
    nameController.clear();
    nicknameController.clear();
    ageController.clear();
    superpower = 'Makalipad';
    faveMotto = 'Haters gonna hate';
  }

@override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> friendsStream = context.watch<SlambookProvider>().friend2;
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        title: const Text("Exercise 5"),
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

          //List<QueryDocumentSnapshot<Object?>>? friends = snapshot.data?.docs;

          return SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pass a callback function from the parent to the child so you can receive a value from the child widget
            const Text(
              "The Tita EditPage",
              style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            TextFieldSample(
              label: "Name",
              hintText: "Enter your name",
              controller: nameController,
              callback: (String val) {
                setState(() {
                  name = val;
                });
              },
            ),
            TextFieldSample(
              label: "Nickname",
              hintText: "Enter your nickname",
              controller: nicknameController,
              callback: (String val) {
                setState(() {
                  nickname = val;
                });
              },
            ),

            TextFieldSample(
              label: "Age",
              hintText: "Enter your age",
              controller: ageController,
              callback: (String val) {
                setState(() {
                  age = int.parse(val);
                });
              },
            ),

            SwitchSample(
              initialValue: isSingle,
              onChanged: (bool value) {
                setState(() {
                  isSingle = value;
                });
              },
            ),
            SliderSample(
              value: happinessLevel,
              onChanged: (double value) {
                setState(() {
                  happinessLevel = value;
                });
              },
            ),

            const Text(
              'Superpower',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const Text(
              'If you were to have a superpower, what would you choose?',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),

            DropdownSample(onSuperpowerSelected: (selectedSuperpower) {
              superpower = selectedSuperpower;
            }),

            const Text(
              'Motto',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            RadioSample(onMottoSelected: (selectedMotto) {
              faveMotto = selectedMotto;
            }),

            Container(
              margin: const EdgeInsets.all(30),
              child: OutlinedButton(
                  // this is the button to validate and save
                  onPressed: () {
                    // this condition states that if the inputs are validated, then perform the actions inside the if block
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();

                      curr = {
                        'name': name,
                        'nickname': nickname,
                        'age': age,
                        'isSingle': isSingle,
                        'happinessLevel': happinessLevel,
                        'superpower': superpower,
                        'faveMotto': faveMotto,
                      };
                      
                      context.read<SlambookProvider>().editFriend(
                        Friend.edit!.id!, curr);

                      setState(() {
                        // this is placed inside a setState method so that when it changes its value, the Text widget below will be rendered
                        showText = true;
                      });
                    }
                  },
                  child: const Text("Edit")),
            ),

            if (showText) ...[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Summary(
                    name: name,
                    nickname: nickname,
                    age: age,
                    isSingle: isSingle,
                    happinessLevel: happinessLevel,
                    superpower: superpower,
                    faveMotto: faveMotto),
              ),
            ],

            Container(
              margin: const EdgeInsets.all(20),
              child: OutlinedButton(
                onPressed: () {
                  //reset the form to its initial state
                  _formKey.currentState!.reset();

                  //clear the values in the state variables
                  setState(() {
                    showText = false;
                    name = "";
                    nickname = "";
                    age = 0;
                    isSingle = false;
                    happinessLevel = 1.0;
                    superpower = '';
                    faveMotto = '';
                  });
                  resetForm();
                },
                child: const Text("Reset"),
              ),
            ),
          ],
        ),
      ),
      );
        },
      ),
    );
  }
}
