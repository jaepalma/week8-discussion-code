import 'package:flutter/material.dart';

class RadioSample extends StatefulWidget {
  final Function(String) onMottoSelected;
  const RadioSample({super.key, required this.onMottoSelected});

  @override
  State<RadioSample> createState() => _RadioSampleState();
}

class _RadioSampleState extends State<RadioSample> {
  static final Map<String, bool> _motto = {
    "Haters gonna hate": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don't talk to strangers when your mouth is full": false,
    "Let's burn the bridge when we get there": false,
  };

  String? _selectedMotto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _motto.keys.map((String option) {
        return RadioListTile<String>(
          title: Text(option, style: const TextStyle(color: Colors.white)),
          value: option,
          groupValue: _selectedMotto,
          onChanged: (String? value) {
            setState(() {
              _selectedMotto = value!;
              widget.onMottoSelected(value);
            });
          },
        );
      }).toList(),
    );
  }

}