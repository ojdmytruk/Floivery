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
          Container(
            width: storesScreenWidth * 0.2,
            height: blockHeight,
            color: Colors.pink[600],
            child: Image.asset(
              "assets/icons/avatar.png",
              width: storesScreenWidth * 0.2,
              height: blockHeight,
            ),
          ),
          Container(
            width: infoBlockWith,
            height: blockHeight,
            color: Colors.green,
            child: Column(
              children: [
                Container(
                  height: blockHeight * 0.2,
                  color: Colors.grey,
                  child: const Center(
                    child: Text("Title"),
                  ),
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
                          child: Text("Rating"),
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
