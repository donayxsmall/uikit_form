// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uikit_form/constant.dart';

class XOutlineButton extends StatelessWidget {
  const XOutlineButton({
    Key? key,
    required this.label,
    this.type = 'primary',
  }) : super(key: key);
  final String label;
  final String type;

  @override
  Widget build(BuildContext context) {
    final Color color;
    if (type == 'success') {
      color = Colors.green;
    } else if (type == 'warning') {
      color = Colors.orange;
    } else if (type == 'danger') {
      color = Colors.red;
    } else if (type == 'info') {
      color = Colors.blueAccent;
    } else if (type == 'disable') {
      color = Colors.grey;
    } else if (type == 'secondary') {
      color = secondary;
    } else {
      color = primary;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(20.0),
          foregroundColor: color,
          side: BorderSide(
            color: color,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {},
        child: Text(
          label,
          style: GoogleFonts.raleway(
            textStyle: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
