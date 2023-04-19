// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uikit_form/constant.dart';

class XButton extends StatelessWidget {
  const XButton({
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
      decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: color.withOpacity(0.2),
          //     spreadRadius: 2,
          //     blurRadius: 10,
          //     offset: const Offset(0, 5),
          //   ),
          // ],
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            elevation: 2,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: type == 'disable' ? null : () {},
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
