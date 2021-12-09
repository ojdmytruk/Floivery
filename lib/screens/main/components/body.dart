import 'package:floivery/components/top_logo.dart';
import 'package:floivery/constants.dart';
import 'package:floivery/screens/main/components/category_button.dart';
import 'package:floivery/screens/main/main_screen.dart';
import 'package:floivery/screens/store_orders/baskets.dart';
import 'package:floivery/screens/store_orders/bouquets.dart';
import 'package:floivery/screens/store_orders/boxes.dart';
import 'package:floivery/screens/store_orders/flowers.dart';
import 'package:floivery/screens/store_orders/order_screen.dart';
import 'package:floivery/screens/stores/stores_screen.dart';
import 'package:floivery/search/search_screen_cities.dart';
import 'package:floivery/search/search_screen_items.dart';
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
          height: heighScreen * 0.05,
          width: widthScreen * 0.85,
          decoration: BoxDecoration(
              border: Border.all(color: kAdditional, width: 1),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.location_on,
                    color: kAdditional,
                  ),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  }),
              const Text(
                "Location",
                style: TextStyle(fontSize: 15, color: kAdditional),
              ),
            ],
          ),
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
                        return const BouquetsScreen();
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
                        return const BasketsScreen();
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
                        return const BoxesScreen();
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
                        return const FlowersScreen();
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
                        return const OrderScreen();
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

class DataSearch extends SearchDelegate<String> {
  final cities = ["Kyiv", "Kharkiv", "Odessa", "Lviv"];
  final recentCities = ["Kyiv", "Odessa"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: StadiumBorder(),
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainScreen();
                },
              ),
            );
          },
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )),
      itemCount: suggestionList.length,
    );
  }
}
