import 'package:flutter/material.dart';
import 'package:floivery/constants.dart';

class RoundedShortButton extends StatelessWidget {

  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedShortButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.3,
      height: size.height * 0.045,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: newTextButton(),
      ),
    );
  }

  Widget newTextButton() {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          textStyle: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }
}