import 'package:flutter/material.dart';

class TextFieldSample extends StatefulWidget {
  final String label;
  final String hintText;
  final Function callback;
  final TextEditingController controller;

  const TextFieldSample({
    required this.label,
    required this.hintText,
    required this.callback,
    required this.controller,
    super.key,
  });

  @override
  State<TextFieldSample> createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.white),
            onSaved: (val) {
              print("Text value: ${val!}");
            },
            validator: (value) {
              if (widget.label == 'Name' || widget.label == 'Nickname') {
                if (value == null || value.isEmpty) {
                  return 'Please answer the required fields';
                }
              } else if (widget.label == 'Age') {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                } else {
                  try {
                    int.parse(value);
                  } catch (e) {
                    return 'Please enter a number for age';
                  }
                }
              }
              return null;
            },
            controller: widget.controller,
            // an onChanged property is placed to call the callback function
            onChanged: (value) {
              // we're not going to save the value of the text inside a separate variable anymore because we're going to pass it directly to the parent widget
              widget.callback(widget.controller.text);
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.label,
                labelStyle: const TextStyle(color: Colors.white),
                hintText: widget.hintText, hintStyle: const TextStyle(color: Colors.white)), 
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
