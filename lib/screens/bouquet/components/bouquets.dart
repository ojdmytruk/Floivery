import 'package:floivery/components/rounded_button_short.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floivery/constants.dart';

class BouqetWidget extends StatelessWidget {
  final String image;
  final String title;

  const BouqetWidget({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blockHeight = MediaQuery.of(context).size.height * 0.1;
    var storesScreenWidth = MediaQuery.of(context).size.width;
    var infoBlockWith = storesScreenWidth * 0.5;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: storesScreenWidth * 0.15,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Container(
            width: storesScreenWidth * 0.2,
            height: blockHeight,
            color: kBackground,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              width: storesScreenWidth * 0.2,
              height: blockHeight,
              // color: Colors.pink[600],
            ),
          ),
          // Image.asset(
          //   image,
          //   fit: ,
          //   width: storesScreenWidth * 0.2,
          //   height: blockHeight,
          //   // color: Colors.pink[600],
          // ),
          Container(
            width: infoBlockWith,
            height: blockHeight,
            color: kBackground,
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: blockHeight * 0.3,
                  color: kBackground,
                  child: Row(
                    children: [
                      Container(
                        color: kBackground,
                        width: infoBlockWith * 0.5,
                        child: Center(
                          child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/flowget.png',
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  "flowget",
                                  style: TextStyle(color: kAdditional),
                                )
                              ],
                            )
                          ),
                        ),
                      Container(
                        color: kBackground,
                        width: infoBlockWith * 0.5,
                        child: Center(
                          child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/price.png',
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  "50 dollars",
                                  style: TextStyle(color: kAdditional),
                                )
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: blockHeight * 0.45,
                  child: RoundedShortButton(
                    text: "Order",
                    press: () {},
                )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
