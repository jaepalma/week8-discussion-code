import 'package:flutter/material.dart';

class SwitchSample extends StatefulWidget {

  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const SwitchSample({super.key, required this.initialValue, required this.onChanged});

  @override
  State<SwitchSample> createState() => _SwitchSampleState();
}

class _SwitchSampleState extends State<SwitchSample>{
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('In a Relationship?',
      style: TextStyle(color: Colors.white)),
      value: widget.initialValue,
      onChanged: widget.onChanged,
    );
  }
}

