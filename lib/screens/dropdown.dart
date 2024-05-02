import 'package:flutter/material.dart';

class DropdownSample extends StatefulWidget {
  final Function(String) onSuperpowerSelected;
  const DropdownSample({super.key, required this.onSuperpowerSelected});

  @override
  State<DropdownSample> createState() => _DropdownSampleState();
}

class _DropdownSampleState extends State<DropdownSample> {
  static final List<String> _superpower = [
    "Makalipad",
    "Maging Invisible",
    "Mapaibig siya",
    "Mabago ang isip niya",
    "Mapalimot siya",
    "Mabalik ang nakaraan",
    "Mapaghiwalay sila",
    "Makarma siya",
    "Mapasagasaan siya sa pison",
    "Mapaitim ang tuhod ng iniibig niya"
  ];

  String _dropdownValue = _superpower.first;

  void resetDropdown() {
    setState(() {
      _dropdownValue = _superpower.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Theme(
              // Set the dropdown menu theme to use a black background
              data: ThemeData.dark().copyWith(
                canvasColor:
                    Colors.black, //set background color of dropdown options
              ),
              child: DropdownButtonFormField<String>(
                  dropdownColor: Colors.black,
                  validator: (val) {
                    if (_dropdownValue == _superpower[0]) {
                      return "Please choose a superpower";
                    }
                    return null;
                  },
                  value: _dropdownValue,
                  items: _superpower.map((superpower) {
                    return DropdownMenuItem<String>(
                      value: superpower,
                      child: Text(
                        superpower,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _dropdownValue = val!;
                      widget.onSuperpowerSelected(val);
                    });
                  })),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
