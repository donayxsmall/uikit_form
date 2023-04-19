import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uikit_form/shared/utils/validator/validator.dart';

class XDropdownField extends StatefulWidget {
  final String label;
  final String? hint;
  final List<Map<String, dynamic>> items;
  final String? Function(String?)? validator;
  final dynamic value;
  final bool emptyMode;
  final Function(dynamic value, String? label) onChanged;

  const XDropdownField({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.emptyMode = true,
    this.hint,
  }) : super(key: key);

  @override
  State<XDropdownField> createState() => _XDropdownFieldState();
}

class _XDropdownFieldState extends State<XDropdownField> {
  List<Map<String, dynamic>> items = [];
  Map<String, dynamic>? selectedValue;

  @override
  void initState() {
    super.initState();

    items = [];
    for (var item in widget.items) {
      items.add(item);
    }

    var values = widget.items
        .where((i) => i["value"].toString() == widget.value.toString())
        .toList();
    if (values.isNotEmpty) {
      selectedValue = values.first;
    }
  }

  setAllItemsToFalse() {
    for (var item in items) {
// item["checked"] = false;
    }
  }

  Map<String, dynamic>? get currentValue {
    if (widget.emptyMode) {
      var foundItems =
          items.where((i) => i["value"] == selectedValue?["value"]).toList();
      if (foundItems.isNotEmpty) {
        return foundItems.first;
      }

      return null;
    }
    return items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownSearch<Map<String, dynamic>>(
        clearButtonProps: const ClearButtonProps(
          isVisible: true,
          iconSize: 10,
          color: Colors.red,
        ),
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: Validator.required,
        popupProps: const PopupProps.menu(
          showSelectedItems: true,
          showSearchBox: true,
          searchDelay: Duration(milliseconds: 10),
        ),
        items: items,
        compareFn: (item, selectedItem) =>
            item['value'] == selectedItem['value'],
        itemAsString: (item) => item['label'],
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              labelText: widget.label,
              labelStyle: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              hintText: widget.hint,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
        ),
        onChanged: (selectedValue) {
          if (selectedValue != null) {
            var label = selectedValue["label"];
            var value = selectedValue["value"];
            widget.onChanged(value, label);

            setState(() {});
          }
        },
        selectedItem: currentValue,
      ),
    );
  }
}
