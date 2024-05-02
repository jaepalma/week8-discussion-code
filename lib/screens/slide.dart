import 'package:flutter/material.dart';

class SliderSample extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChanged;

  const SliderSample({super.key, required this.value, required this.onChanged});

  @override
  _SliderSampleState createState() => _SliderSampleState();
}

class _SliderSampleState extends State<SliderSample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Happiness Level',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const Text(
          'On a scale of 1-happy, gaano kasaya ang adulting?',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),

        Slider(
          value: widget.value,
          min: 1.0,
          max: 10.0,
          divisions: 9,
          label: 'Happiness Level: ${widget.value.toInt()}',
          onChanged: widget.onChanged,
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
