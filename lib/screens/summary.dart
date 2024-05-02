import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final String name;
  final String nickname;
  final int age;
  final bool isSingle;
  final double happinessLevel;
  final String superpower;
  final String faveMotto;

  const Summary({super.key, 
    required this.name,
    required this.nickname,
    required this.age,
    required this.isSingle,
    required this.happinessLevel,
    required this.superpower,
    required this.faveMotto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Summary:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
        const SizedBox(height: 10),
        Text("Name: $name", style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text("Nickname: $nickname", style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text("Age: $age", style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text("Happiness Level: $happinessLevel", style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text("Superpower: $superpower", style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text("Favorite Motto: $faveMotto", style: const TextStyle(fontSize: 18, color: Colors.white)),
      ],
    );
  }
}
