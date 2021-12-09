import 'package:flutter/material.dart';
import 'package:floivery/constants.dart';

class CategoryButton extends StatelessWidget {
  final String text, imagePath;
  final VoidCallback press;
  final Color color, textColor, borderColour;

  const CategoryButton({
    Key? key,
    required this.text,
    required this.press,
    required this.imagePath,
    this.color = kBackground,
    this.textColor = const Color(0xFF697077),
    this.borderColour = const Color(0xFF697077),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightButton = MediaQuery.of(context).size.height * 0.08;
    var widthButton = MediaQuery.of(context).size.width * 0.16;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        newCategoryButton(heightButton, widthButton),
      ]),
    );
  }

  Widget newCategoryButton(double heightButton, double widthButton) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: heightButton * 0.9,
              width: widthButton * 0.9,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
