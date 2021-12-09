import 'package:flutter/material.dart';
import 'package:floivery/components/text_field_container.dart';
import 'package:floivery/constants.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText, labelText;
  // final TextEditingController controller;
  final String? Function(String?) val;
  const PasswordField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.hintText,
    required this.val,
    // required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        // controller: controller,
        validator: val,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.blueGrey),
          hintText: hintText,
          suffixIcon: const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}