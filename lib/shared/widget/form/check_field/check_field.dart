import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class XCheckField extends StatefulWidget {
  final String label;
  final String? hint;
  final bool selectAll;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final Future<List<Map<String, dynamic>>> Function()? onFuture;
  final Function(List<Map<String, dynamic>> values, List ids) onChanged;

  const XCheckField({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.onFuture,
    this.hint,
    this.selectAll = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<XCheckField> createState() => _XCheckFieldState();
}

class _XCheckFieldState extends State<XCheckField> {
  List<Map<String, dynamic>> items = [];
  bool isCheckedAll = false;
  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      items.add(Map.from(item));
    }

    // print(items);

    loadItems();
  }

  loadItems() async {
    if (widget.onFuture == null) return;

    List<Map<String, dynamic>> newItems = await widget.onFuture!();
    items = newItems;
    setState(() {});
  }

  checkedSelectAll() {
    List<Map<String, dynamic>> selectedFalse =
        items.where((i) => i["checked"] == false).toList();
    if (selectedFalse.isEmpty) {
      isCheckedAll = true;
    } else {
      isCheckedAll = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectAll) {
      return checkedWithSelectAll();
    }
    return checked();
  }

  Widget checkedWithSelectAll() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormField(
        initialValue: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => widget.validator!(items),
        enabled: true,
        builder: (FormFieldState<bool> field) {
          return Container(
            // color: Colors.red,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Select All",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    Checkbox(
                      activeColor: Colors.green,
                      value: isCheckedAll,
                      onChanged: (value) {
                        isCheckedAll = value!;
                        for (var element in items) {
                          element['checked'] = value;
                        }
                        field.didChange(true);

                        List<Map<String, dynamic>> selectedValues =
                            items.where((i) => i["checked"] == true).toList();
                        List ids =
                            selectedValues.map((e) => e["value"]).toList();
                        widget.onChanged(selectedValues, ids);
                        setState(() {});
                      },
                    ),
                  ],
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    errorText: field.errorText,
                    border: InputBorder.none,
                    helperText: widget.hint,
                  ),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var item = items[index];
                      return CheckboxListTile(
                        activeColor: Colors.green,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          "${item["label"]}",
                          style: GoogleFonts.raleway(
                            textStyle:
                                const TextStyle(fontSize: 15, letterSpacing: 2),
                          ),
                        ),
                        value: item["checked"] ?? false,
                        onChanged: (val) {
                          items[index]["checked"] = val;
                          field.didChange(true);
                          setState(() {});
                          String? label = items[index]["label"];
                          int foundIndex = items
                              .indexWhere((item) => item["label"] == label);
                          dynamic value = items[foundIndex]["value"];

                          checkedSelectAll();

                          List<Map<String, dynamic>> selectedValues =
                              items.where((i) => i["checked"] == true).toList();
                          List ids =
                              selectedValues.map((e) => e["value"]).toList();
                          widget.onChanged(selectedValues, ids);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget checked() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormField(
        initialValue: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => widget.validator!(items),
        enabled: true,
        builder: (FormFieldState<bool> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              errorText: field.errorText,
              border: InputBorder.none,
              helperText: widget.hint,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return CheckboxListTile(
                  activeColor: Colors.green,
                  title: Text(
                    "${item["label"]}",
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                  value: item["checked"] ?? false,
                  onChanged: (val) {
                    items[index]["checked"] = val;
                    field.didChange(true);
                    setState(() {});
                    String? label = items[index]["label"];
                    int foundIndex =
                        items.indexWhere((item) => item["label"] == label);
                    dynamic value = items[foundIndex]["value"];
                    List<Map<String, dynamic>> selectedValues =
                        items.where((i) => i["checked"] == true).toList();
                    List ids = selectedValues.map((e) => e["value"]).toList();
                    widget.onChanged(selectedValues, ids);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
