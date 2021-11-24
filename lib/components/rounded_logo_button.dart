import 'package:flutter/material.dart';
import 'package:floivery/constants.dart';

class RoundedLogoButton extends StatelessWidget {

  final String text, imagePath;
  final VoidCallback press;
  final Color color, textColor, borderColour;
  const RoundedLogoButton({
    Key? key,
    required this.text,
    required this.press,
    required this.imagePath,
    this.color = kBackground,
    this.textColor = const Color (0xFF697077),
    this.borderColour = const Color (0xFF697077),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: newTextButton(),
      ),
    );
  }


  Widget newTextButton() {
    return TextButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            imagePath,
            height: 20,
            width: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ))
        ],
      ),
      onPressed: press,

      style: TextButton.styleFrom(
          primary: color,
          side: BorderSide(color: borderColour),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          textStyle: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }
}