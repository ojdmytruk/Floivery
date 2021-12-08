import 'package:flutter/material.dart';

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
            color: Colors.green,
            child: Column(
              children: [
                Text(
                  'Antioch Flower Shop',
                  style: const TextStyle(fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: blockHeight * 0.5,
                  color: Colors.yellow,
                  child: Row(
                    children: [
                      Container(
                        color: Colors.orange,
                        width: infoBlockWith * 0.5,
                        child: const Center(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink,
                            size: 15.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        width: infoBlockWith * 0.5,
                        child: const Center(
                          child: Text("Reviews"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: blockHeight * 0.3,
                  color: Colors.blue,
                  child: const Center(
                    child: Text("Submit"),
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
