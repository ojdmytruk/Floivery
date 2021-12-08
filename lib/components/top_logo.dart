import 'package:floivery/constants.dart';
import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heighLogo = MediaQuery.of(context).size.height * 0.10;
    var widthLogo = MediaQuery.of(context).size.width * 0.9;
    return Container(
      padding: const EdgeInsets.only(top: 25),
      height: heighLogo,
      width: widthLogo,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/small_left.png",
            width: widthLogo * 0.3,
            height: heighLogo,
          ),
          Container(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Title(
              child: const Text('FLOIVERY',
                  style: TextStyle(fontSize: 24.0, color: kPrimaryColor)),
              color: kBackground,
            ),
          ),
          Image.asset(
            "assets/icons/small_right.png",
            width: widthLogo * 0.3,
            height: heighLogo,
          ),
        ],
      ),
    );
  }
}
