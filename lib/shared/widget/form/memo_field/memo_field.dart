import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class XMemoField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String) onChanged;

  const XMemoField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<XMemoField> createState() => _XMemoFieldState();
}

class _XMemoFieldState extends State<XMemoField> {
  FocusNode focusNode = FocusNode();
  GlobalKey key = GlobalKey();
  TextEditingController textEditingController = TextEditingController();
  bool _showClearIcon = false;

  @override
  void initState() {
    focusNode.addListener(() {
      print("focusNodeListener");
      if (focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 300), () {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => Scrollable.ensureVisible(
                    key.currentContext!,
                    alignmentPolicy:
                        ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
                  ));
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    if (focusNode.hasFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => Scrollable.ensureVisible(
                  key.currentContext!,
                  alignmentPolicy:
                      ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
                ));
      });
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        key: key,
        initialValue: widget.value,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: 200,
        maxLines: 6,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: GoogleFonts.raleway(
            textStyle: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          // enabledBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.blueGrey,
          //   ),
          // ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          suffixIcon: _showClearIcon
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    textEditingController.clear();
                    setState(() {
                      _showClearIcon = false;
                    });
                  },
                )
              : null,
          helperText: widget.hint,
        ),
        onChanged: (value) {
          setState(() {
            if (value.isNotEmpty) {
              _showClearIcon = true;
            } else {
              _showClearIcon = false;
            }
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
