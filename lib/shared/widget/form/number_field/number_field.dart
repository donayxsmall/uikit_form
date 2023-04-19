import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class XNumberField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  final String? pattern;
  final String? locale;

  const XNumberField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
    this.onSubmitted,
    this.pattern,
    this.locale = "en_US",
  }) : super(key: key);

  @override
  State<XNumberField> createState() => _XNumberFieldState();
}

class _XNumberFieldState extends State<XNumberField> {
  String? value;
  late TextEditingController controller;
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();

    RegExp r = RegExp(r'^[0-9]+(.[0-9]+)?$');
    value = widget.value?.replaceAll(RegExp(r'^[0-9,]+$'), '');
    controller = TextEditingController(
      text: formattedValue,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? get formattedValue {
    if (widget.pattern != null) {
      final currencyFormat = NumberFormat(widget.pattern, widget.locale);
      var pValue = num.tryParse(value.toString()) ?? 0;
      print("pValue: $pValue");
      return currencyFormat.format(pValue);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: widget.validator,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: GoogleFonts.raleway(
            textStyle: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          suffixIcon: _showClearIcon
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    setState(() {
                      _showClearIcon = false;
                    });
                  },
                )
              : null,
          helperText: widget.hint,
        ),
        onChanged: (newValue) {
          var newValue = controller.text;

          value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');

          controller.text = formattedValue ?? "";
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);
          widget.onChanged(newValue.replaceAll(RegExp(r'D'), ''));

          setState(() {
            if (value.toString().isNotEmpty) {
              _showClearIcon = true;
            } else {
              _showClearIcon = false;
            }
          });
        },
        onFieldSubmitted: (newValue) {
          var newValue = controller.text;
          print("newValue: $newValue");
          value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');
          print("value: $value");
          controller.text = formattedValue ?? "";
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(newValue.replaceAll(RegExp(r'D'), ''));
          }
        },
      ),
    );
  }
}
