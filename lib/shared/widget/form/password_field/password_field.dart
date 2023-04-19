import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class XPasswordField extends StatefulWidget {
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  const XPasswordField({
    Key? key,
    required this.label,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.maxLength,
    required this.onChanged,
    this.onSubmitted,
    this.obscure = true,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<XPasswordField> createState() => _XPasswordFieldState();
}

class _XPasswordFieldState extends State<XPasswordField> {
  TextEditingController textEditingController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  getValue() {
    return textEditingController.text;
  }

  @override
  setValue(value) {
    textEditingController.text = value;
  }

  @override
  resetValue() {
    textEditingController.text = "";
  }

  @override
  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: widget.enabled,
        controller: textEditingController,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: _obscureText,
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),
          helperText: widget.hint,
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
