import 'package:flutter/material.dart';
import 'package:floivery/components/text_field_container.dart';
import 'package:floivery/constants.dart';

class InputField extends StatelessWidget {
  final String hintText, labelText;
  // final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    // this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
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