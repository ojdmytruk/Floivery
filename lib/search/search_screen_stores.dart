import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:floivery/constants.dart';
import 'package:flutter/material.dart';

class SearchStoresScreen extends StatelessWidget {
  const SearchStoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heighScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: Column(
          children: [
            const TopLogo(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: heighScreen * 0.05,
                width: widthScreen * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(color: kAdditional, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          showSearch(context: context, delegate: DataSearch());
                        }),
                    const Text(
                      "Search field",
                      style: TextStyle(fontSize: 16, color: kAdditional),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class DataSearch extends SearchDelegate<String> {
  final Stores = [
    Store("Flowers 29", 5.0),
    Store("Flowerista", 4.3),
    Store("Flowery", 4.7),
    Store("Donpion", 3.0),
    Store("Camellia", 1.0)
  ];
  final recentStores = [
    Store("Flowers 29", 5.0),
    Store("Flowerista", 4.5),
  ];

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
          color: kAdditional,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: const StadiumBorder(),
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentStores
        : Stores.where(
                (p) => p.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: const Icon(Icons.store, color: kPrimaryColor),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: suggestionList[index].name.substring(query.length),
                  style: const TextStyle(color: kPrimaryColor),
                ),
              ],
              text: suggestionList[index].name.substring(0, query.length),
              style: const TextStyle(
                  color: kAdditional, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
                text: "Shop's rating: " +
                    suggestionList[index].rating.toString() +
                    " stars",
                style: TextStyle(color: Colors.grey)),
          ),
          trailing: suggestionList[index].rating > 4.5
              ? const Icon(
                  Icons.star,
                  color: Colors.orange,
                )
              : null),
      itemCount: suggestionList.length,
    );
  }
}

class Store {
  String name;
  double rating;
  Store(this.name, this.rating);
}
