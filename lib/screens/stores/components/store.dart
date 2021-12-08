import 'package:flutter/material.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var block_height = MediaQuery.of(context).size.height * 0.1;
    var stores_screen_width = MediaQuery.of(context).size.width;
    var info_block_with = stores_screen_width * 0.5;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: stores_screen_width * 0.15,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Container(
            width: stores_screen_width * 0.2,
            height: block_height,
            color: Colors.pink[600],
            child: const Center(
              child: Text("Picture"),
            ),
          ),
          Container(
            width: info_block_with,
            height: block_height,
            color: Colors.green,
            child: Column(
              children: [
                Container(
                  height: block_height * 0.2,
                  color: Colors.grey,
                  child: const Center(
                    child: Text("Title"),
                  ),
                ),
                Container(
                  height: block_height * 0.5,
                  color: Colors.yellow,
                  child: Row(
                    children: [
                      Container(
                        color: Colors.orange,
                        width: info_block_with * 0.5,
                        child: const Center(
                          child: Text("Rating"),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        width: info_block_with * 0.5,
                        child: const Center(
                          child: Text("Reviews"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: block_height * 0.3,
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
