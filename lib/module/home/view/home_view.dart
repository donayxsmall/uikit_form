import 'package:flutter/material.dart';

import 'package:uikit_form/core.dart';
import 'package:uikit_form/model/country.dart';
import 'package:uikit_form/shared/utils/validator/validator.dart';
import 'package:uikit_form/shared/widget/button/button.dart';
import 'package:uikit_form/shared/widget/form/autocomplete_field/autocomplete_field.dart';
import 'package:uikit_form/shared/widget/form/check_field/check_field.dart';
import 'package:uikit_form/shared/widget/form/dropdown/dropdown_field.dart';
import 'package:uikit_form/shared/widget/form/imagepicker/imagepicker.dart';
import 'package:uikit_form/shared/widget/form/memo_field/memo_field.dart';
import 'package:uikit_form/shared/widget/form/number_field/number_field.dart';
import 'package:uikit_form/shared/widget/form/password_field/password_field.dart';
import 'package:uikit_form/shared/widget/form/radio_field/radio_field.dart';
import 'package:uikit_form/shared/widget/form/textfield/textfield.dart';
import 'package:uikit_form/shared/widget/outline_button/outline_button.dart';

import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  // HomeView({super.key});

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Button",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const XButton(
                label: 'Success',
                type: 'success',
              ),
              const XButton(
                label: 'Warning',
                type: 'warning',
              ),
              const XButton(
                label: 'Danger',
                type: 'danger',
              ),
              const XButton(
                label: 'Info',
                type: 'info',
              ),
              const XButton(
                label: 'Disable',
                type: 'disable',
              ),
              const XButton(
                label: 'Primary',
                type: 'primary',
              ),
              const XButton(
                label: 'Secondary',
                type: 'secondary',
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Outline Button",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const XOutlineButton(
                label: 'Success',
                type: 'success',
              ),
              const XOutlineButton(
                label: 'Warning',
                type: 'warning',
              ),
              const XOutlineButton(
                label: 'Danger',
                type: 'danger',
              ),
              const XOutlineButton(
                label: 'Info',
                type: 'info',
              ),
              const XOutlineButton(
                label: 'Disable',
                type: 'disable',
              ),
              const XOutlineButton(
                label: 'Primary',
                type: 'primary',
              ),
              const XOutlineButton(
                label: 'Secondary',
                type: 'secondary',
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Form",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              XTextField(
                label: "Nama",
                validator: Validator.required,
                onChanged: (value) {},
              ),
              XNumberField(
                label: "Age",
                validator: Validator.required,
                onChanged: (value) {},
              ),
              XPasswordField(
                label: "Password",
                validator: Validator.required,
                onChanged: (value) {},
              ),
              XMemoField(
                label: "Address",
                validator: Validator.required,
                onChanged: (value) {},
              ),
              XDropdownField(
                label: "Country",
                hint: "Your Country",
                value: "GB",
                validator: Validator.required,
                items: controller.countries,
                onChanged: (value, label) {
                  print("$value : $label");
                },
              ),
              XAutoCompleted(
                label: "Fruit",
                value: "jeruk",
                items: const [
                  {"label": "Apel", "value": "apel"},
                  {"label": "Anggur", "value": "anggur"},
                  {"label": "Jeruk", "value": "jeruk"},
                  {"label": "Mangga", "value": "mangga"},
                  {"label": "Pisang", "value": "pisang"},
                ],
                onChanged: (label, value) {
                  print("autocomplete : label => $label , value => $value");
                },
              ),
              XImagePicker(
                label: "Photo",
                hint: "Your photo",
                validator: Validator.required,
                value: null,
                onChanged: (value) {},
              ),
              XCheckField(
                label: "Club",
                // hint: "Your favorite football club",
                validator: Validator.atLeastOneitem,
                selectAll: true,
                items: const [
                  {
                    "label": "Persib",
                    "value": 101,
                    "checked": false,
                  },
                  {
                    "label": "Persikabo",
                    "value": 102,
                    "checked": true,
                  }
                ],
                onChanged: (values, ids) {
                  print(values);
                },
              ),
              XRadioField(
                label: "Gender",
                validator: Validator.atLeastOneitem,
                items: const [
                  {
                    "label": "Female",
                    "value": 1,
                  },
                  {
                    "label": "Male",
                    "value": 2,
                  }
                ],
                onChanged: (value, label) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, Country item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        // subtitle: Text(item.createdAt.toString()),
        leading: const CircleAvatar(
          backgroundImage: NetworkImage("https://i.ibb.co/PGv8ZzG/me.jpg"),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
