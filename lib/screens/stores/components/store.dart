import 'package:flutter/material.dart';
import 'package:floivery/components/rounded_button_short.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blockHeight = MediaQuery.of(context).size.height * 0.1;
    var storesScreenWidth = MediaQuery.of(context).size.width;
    var infoBlockWith = storesScreenWidth * 0.5;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: storesScreenWidth * 0.15,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/shop1.png",
            width: storesScreenWidth * 0.2,
            height: blockHeight,
          ),
          Container(
            width: infoBlockWith,
            height: blockHeight,
            child: Column(
              children: [
                Text(
                  'Antioch Flower Shop',
                  style: const TextStyle(fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: blockHeight * 0.3,
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.star_border_rounded),
                      const Expanded(
                        child: Text("0"),
                      ),
                      const Icon(Icons.chat_outlined),
                      const Expanded(
                        child: Text("reviews (0)"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: blockHeight * 0.5,
                  child: RoundedShortButton(
                    text: "Order",
                    press: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
