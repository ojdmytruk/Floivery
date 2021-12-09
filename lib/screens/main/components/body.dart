import 'package:floivery/components/top_logo.dart';
import 'package:floivery/constants.dart';
import 'package:floivery/screens/main/components/category_button.dart';
import 'package:floivery/screens/main/main_screen.dart';
import 'package:floivery/screens/stores/stores_screen.dart';
import 'package:flutter/material.dart';

class BodyOfMain extends StatefulWidget {
  const BodyOfMain({Key? key}) : super(key: key);

  @override
  _BodyOfMainState createState() => _BodyOfMainState();
}

class _BodyOfMainState extends State<BodyOfMain> {
  @override
  Widget build(BuildContext context) {
    var heighScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const TopLogo(),
        Container(
          height: heighScreen * 0.08,
          width: widthScreen,
          color: Colors.green,
        ),
        const Text(
          "Categories",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: kPrimaryColor),
        ),
        Container(
          height: heighScreen * 0.13,
          width: widthScreen,
          decoration: BoxDecoration(border: Border.all(color: kPrimaryColor)),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoryButton(
                imagePath: "assets/icons/company.jpg",
                text: "Stores",
                color: kBackground,
                textColor: kAdditional,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const StoresScreen();
                      },
                    ),
                  );
                },
              ),
              CategoryButton(
                imagePath: "assets/icons/bouqouet.jpg",
                text: "Bouqouets",
                color: kBackground,
                textColor: kAdditional,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const StoresScreen();
                      },
                    ),
                  );
                },
              ),
              CategoryButton(
                imagePath: "assets/icons/busket.jpg",
                text: "Baskets",
                color: kBackground,
                textColor: kAdditional,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const StoresScreen();
                      },
                    ),
                  );
                },
              ),
              CategoryButton(
                imagePath: "assets/icons/box.jpg",
                text: "Boxes",
                color: kBackground,
                textColor: kAdditional,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const StoresScreen();
                      },
                    ),
                  );
                },
              ),
              CategoryButton(
                imagePath: "assets/icons/sinle_rose.jpg",
                text: "Flowers",
                color: kBackground,
                textColor: kAdditional,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const StoresScreen();
                      },
                    ),
                  );
                },
              ),
              CategoryButton(
                imagePath: "assets/icons/146.jpg",
                text: "Presents",
                color: kBackground,
                textColor: kAdditional,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const StoresScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: widthScreen * 0.8,
          height: heighScreen * 0.45,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: const DecorationImage(
                        image: AssetImage('assets/icons/try.png'),
                        fit: BoxFit.cover),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MainScreen();
                          },
                        ),
                      );
                    },
                    child: Column(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(right: 170, top: 10),
                        child: Container(
                          width: widthScreen * 0.21,
                          padding:
                              const EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                              color: kSpecialOffer,
                              borderRadius: BorderRadius.circular(20)
                              //more than 50% of width makes circle
                              ),
                          child: const Text(
                            'SPECIAL OFFER',
                            style: TextStyle(
                                fontSize: 10.3,
                                //backgroundColor: kSpecialOffer,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 190),
                        child: const Text(
                          '-25% DISCOUNT FOR THE SECOND ITEM IN ORDER',
                          style: TextStyle(
                              fontSize: 18.0,
                              backgroundColor: kSpecialOffer,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 185),
                        child: const Text(
                          'theflorista',
                          style: TextStyle(
                              fontSize: 16.0,
                              backgroundColor: kSpecialOffer,
                              color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
