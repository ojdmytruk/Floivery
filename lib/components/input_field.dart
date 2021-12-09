import 'package:flutter/material.dart';
import 'package:floivery/components/text_field_container.dart';
import 'package:floivery/constants.dart';

class InputField extends StatelessWidget {
  final String hintText, labelText;
  // final TextEditingController controller;
  final ValueChanged<String> onChanged;
  // final String? Function(String?) val;
  final List? inputFormaters;
  const InputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    // required this.controller,
    // required this.val,
    required this.onChanged,
    required this.inputFormaters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        // controller: controller,
        // validator: val,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        inputFormatters: [],
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.blueGrey),
          hintText: hintText,
          // border: InputBorder.none,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}