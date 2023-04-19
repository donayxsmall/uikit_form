// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class XDropdownTest extends StatefulWidget {
  const XDropdownTest({
    Key? key,
  }) : super(key: key);

  @override
  State<XDropdownTest> createState() => _XDropdownTestState();
}

class _XDropdownTestState extends State<XDropdownTest> {
  final List<Map<String, dynamic>> _options = [
    {"value": "value1", "label": "Label 1"},
    {"value": "value2", "label": "Label 2"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
    {"value": "value3", "label": "Label 3"},
  ];
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField(
        value: _selectedOption,
        items: _options.map((option) {
          return DropdownMenuItem(
            value: option["value"],
            child: Text(option["label"]),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedOption = value.toString();
          });
          print(value);
        },
        decoration: const InputDecoration(
          labelText: 'Select an option',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}
