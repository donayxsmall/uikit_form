import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class XAutoCompleted extends StatefulWidget {
  const XAutoCompleted({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.value,
    required this.onChanged,
  }) : super(key: key);
  final String label;
  final List<Map<String, dynamic>> items;
  final String? Function(String? item)? validator;
  final dynamic value;
  final Function(dynamic value, String? label) onChanged;

  @override
  State<XAutoCompleted> createState() => _XAutoCompletedState();
}

class _XAutoCompletedState extends State<XAutoCompleted> {
  final TextEditingController typeAheadController = TextEditingController();
  String? selectedValue;

  @override
  void initState() {
    if (widget.value != null) {
      var foundItems = widget.items
          .where(
              (option) => option['value'].toString() == widget.value.toString())
          .toList();

      if (foundItems.isNotEmpty) {
        typeAheadController.text = foundItems.first['label'];
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    typeAheadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: typeAheadController,
                decoration: InputDecoration(
                  labelText: widget.label,
                  hintText: 'Type something',
                  labelStyle: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              suggestionsCallback: (pattern) {
                if (pattern.length < 2) {
                  return [];
                }
                return widget.items
                    .where((option) => option['label']
                        .toLowerCase()
                        .contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion['label']),
                );
              },
              transitionBuilder:
                  (context, suggestionsBox, animationController) {
                return suggestionsBox;
                // return FadeTransition(
                //   opacity: CurvedAnimation(
                //       parent: animationController, curve: Curves.fastOutSlowIn),
                //   child: suggestionsBox,
                // );
              },
              onSuggestionSelected: (suggestion) {
                typeAheadController.text = suggestion['label'];
                selectedValue = suggestion['label'];
                setState(() {});

                var label = suggestion['label'];
                var value = suggestion['value'];

                widget.onChanged(label, value);
              },
              validator: (String? text) {
                // print("text : $text");
                // print("selectedvalue : $selectedValue");

                if (selectedValue != null) {
                  if (text!.toLowerCase().toString() !=
                      selectedValue!.toLowerCase().toString()) {
                    return 'Please select a ${widget.label}';
                  }
                }

                if (text!.isEmpty) {
                  return 'Please select a ${widget.label}';
                }
                return null;
              },
              onSaved: (value) {
                selectedValue = value!;
                // print(value);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            // RaisedButton(
            //   child: const Text('Submit'),
            //   onPressed: () {
            //     if (_formKey.currentState.validate()) {
            //       _formKey.currentState.save();
            //       Scaffold.of(context).showSnackBar(SnackBar(
            //           content: Text('Your Favorite City is $_selectedCity')));
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
